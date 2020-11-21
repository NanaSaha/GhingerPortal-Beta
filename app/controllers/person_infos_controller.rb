class PersonInfosController < ApplicationController
  before_action :set_person_info, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # before_filter :load_permissions

  # GET /person_infos
  # GET /person_infos.json
  def index
    @person_infos = PersonInfo.all.paginate(:page => params[:page], :per_page => 10).order('id desc')
    @person_contact_infos = PersonContactInfo.all
    @person_type_masters = PersonTypeMaster.all

    
   if params[:count]
      params[:count]
   else
     params[:count] = 10
   end
   
   if params[:page]
     page = params[:page].to_i
   else
     page = 1
   end
   
   if params[:per_page].present?
      # perpage = params[:per_page]
      @per_page = params[:per_page] || PersonInfo.per_page || 10
      @person_infos = PersonInfo.paginate( :per_page => @per_page, :page => params[:page])
   else
    perpage = 10
   end
   @per_page = params[:per_page] || PersonInfo.per_page || 10
   page = if params[:page]
            params[:page].to_i
           else
            1
           end
   
 

    if params[:patient]
       @person_infos = PersonInfo.patient_search(params[:patient]).paginate( :page => params[:page], :per_page => 10).order('created_at desc')
    elsif params[:doctor]
       @person_infos = PersonInfo.doctor_search(params[:doctor]).paginate( :page => params[:page], :per_page => 10).order('created_at desc')
    elsif params[:nurse]
      @person_infos = PersonInfo.nurse_search(params[:nurse]).paginate( :page => params[:page], :per_page => 10).order('created_at desc')
    elsif params[:pharmacist]
      @person_infos = PersonInfo.pharmacist_search(params[:pharmacist]).paginate( :page => params[:page], :per_page => 10).order('created_at desc')
    elsif params[:laboratorist]
      @person_infos = PersonInfo.laboratorist_search(params[:laboratorist]).paginate( :page => params[:page], :per_page => 10).order('created_at desc')
    end


  if params[:user_type_title]
       @person_type = params[:user_type_title]
       logger.info "Then person is #{@person_type.inspect}"
       @person_infos = PersonInfo.joins(:person_type_master).where(person_type_masters: {user_type_title: @person_type}).paginate( :page => params[:page], :per_page => 10).order('created_at desc')
  end  
    
    respond_to do |format|
      logger.info "what is the url calling this??: ans #{request.referer}"
      format.js
      format.html
      format.csv { send_data @person_infos.to_csv(options = {}, page, perpage)}
      format.xls { send_data @person_infos.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
  end

    def all_person_info_excel
    @person_infos = PersonInfo.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @person_infos.to_csv }
      format.xls { send_data @person_infos.to_csv(options={col_sep: "\t"}) }
    end
    
  end

  # GET /person_infos/1
  # GET /person_infos/1.json
  def show 
    @person_type_masters = PersonTypeMaster.all
  end

  # GET /person_infos/new
  def new
    @person_info = PersonInfo.new
    @person_type_masters = PersonTypeMaster.all
    
    @person_info.person_contact_infos.build
    @person_info.users.build   
  end
  
    # confirm user form show
  def new_confirm_person_info    
      @person_info_extra = PersonInfoExtra.new
      # @person_id = params[:person_id]
      # session[:person_id] = @person_id
      # logger.info "Person id is #{@person_id.inspect}"
      
      @reg_id = params[:reg_id]
      @reg = Registration.find(@reg_id)
      @person_info = PersonInfo.where(reg_id: @reg_id)[0]
      
      @person_id = @person_info.id
      @user = User.where(person_id: @person_id)[0]
      @user_id = @user.id
      # session[:person_id] = @person_id
      logger.info "Person id is #{@person_id.inspect}"
      
      
      @specialty_masters = SpecialtyMaster.order(:title).where("title like ?", "%#{params[:specialty_id]}")
     
      @the_list = @specialty_masters.map { |a|[a.title+" ",a.id]  }
      
      @professional_groups = ProfesionalGroup.order(:group_name).where("group_name like ?", "%#{params[:profession_group_id]}")
      @group = @professional_groups.map { |a|[a.group_name+" ",a.id]  }
     
 
     
     
  end
  
  # //user confirmation action
  def confirm_person_registration
    @person_info = PersonInfo.new(person_info_params)
    @password = params[:person_info][:users_attributes]['0'][:password]
    @contact = params[:person_info][:person_contact_infos_attributes]['0'][:contact_number]
     @email = params[:person_info][:person_contact_infos_attributes]['0'][:email]
    @encrypted_password = Digest::SHA256.hexdigest(@password)
     
    # #@person_type_masters = PersonTypeMaster.all  
      @reg_id = session.delete(:reg_id)
      @reg = Registration.find(@reg_id)  
      
       @approved_registrations = Registration.where(verified: true).paginate(:page => params[:page], :per_page => 10).order('id desc')
      
     respond_to do |format|
       if @person_info.save
         
         @reg.update(
            verified: true,
            user_id: current_user.id,
            user_uniq_code: nil
         )
         
         @reg.save!
         
         login_details= PasswordTable.new(
            password: @encrypted_password,
            mobile_number: @contact,
            email:  @email,
            status: false
          )
         
          if login_details.save!
           format.js { flash.now[:notice] = "Registration approval successful." }
           format.html { redirect_to @person_info, notice: 'Person info was successfully created.' }
           format.json { render :show, status: :created, location: @person_info }
         end
         
       else
         @person_type_masters = PersonTypeMaster.all
         format.js { render :new_confirm_person_info }
         
         # Maintain values for fields
           # @reg_id = session.delete(:reg_id)
           logger.info "Get session stored is #{@reg_id}"
           # @reg = Registration.find(@reg_id)
           
           # logger.info "Reg id is #{@reg_id.inspect}"
           # logger.info "Reg is #{@reg.inspect}"
           session[:reg_id] = @reg_id
           logger.info "check chech after rollback #{@reg_id.inspect}"
           # details
           @surname = @reg.surname
           @other_names = @reg.other_names
           @ref_id = @reg.user_type
           @contact = @reg.mobile_number
           @dob = @reg.dob
           @email = @reg.email
           @user_unique_code = @reg.user_uniq_code 
            
           if @ref_id == 'D'
              @suburb_id = @reg.surburb_id          
           end
         
         # values for fields ends
         
         format.js { flash.now[:notice] = "Fields with * are required" }
         format.html { render :new }
         format.json { render json: @person_info.errors, status: :unprocessable_entity }
       end
     end
  end
  

  # GET /person_infos/1/edit
  def edit
    @person_type_masters = PersonTypeMaster.all
    @user = User.find_by_person_id(params[:id])
  end
  
  def edit_profile
    @person_type_masters = PersonTypeMaster.all
    @user_id = current_user.id
    @user = User.find(@user_id)
    @person_id = @user.person_id
    @person_info = PersonInfo.find(@person_id)
    
  end
   
  
  def enable_player
      player_id=params[:chosen]
      player = PersonInfo.find(player_id)
      user = User.where(person_id: player_id)[0]
      
     
     if player.update(:active_status => 1) and user.update(:active_status => 1)       
       redirect_to person_infos_path, notice: 'Personnel was successfully enabled.'
     end
  end

  def disable_player
      player_id=params[:chosen]     
      player = PersonInfo.find(player_id)
      user = User.where(person_id: player_id)[0]
      
     if player.update(:active_status => 0) and user.update(:active_status => 0) 
       redirect_to person_infos_path, notice: 'Personnel was successfully disabled.'
     end    
  end

  
  def filter        
      
  end
  
  
  def process_referal
     @ref_id = params[:ref_id]
     @referal_details = Referal.where(id: @ref_id)[0]
     
     @surname = @referal_details.surname
     @other_names = @referal_details.other_names
     @contact = @referal_details.contact
     @dob = @referal_details.dob
     @processed_status = @referal_details.processed_status
     
     @person_info = PersonInfo.new
     @person_type_masters = PersonTypeMaster.all
      
     @person_info.person_contact_infos.build
     @person_info.users.build
     
     session[:ref_id] = @ref_id
  end

  def process_referal_create   
     @person_info = PersonInfo.new(person_info_params)
     @ref_id = session.delete(:ref_id)
     @referal_details = Referal.where(id: @ref_id)[0]
    
         
     @surname = person_info_params[:surname]
     @other_names = person_info_params[:other_names]
     @contact = params[:person_info][:person_contact_infos_attributes]['0'][:contact_number]
     @dob = person_info_params[:dob]
     
    # #@person_type_masters = PersonTypeMaster.all    
     respond_to do |format|
       if @person_info.save
         
          @referal_details.update(
              user_id: current_user.id,
              processed_status: true
            )
         
         format.js { flash.now[:notice] = "Personnel was successfully created." }
         format.html { redirect_to person_type_masters_path, notice: 'Person info was successfully created.' }
         format.json { render :show, status: :created, location: @person_info }
       else
         @person_type_masters = PersonTypeMaster.all
         # format.js { render :process_referal }
         # format.js { flash.now[:notice] = "Fields with * are required" }
         format.html { render :process_referal }
         format.json { render json: @person_info.errors, status: :unprocessable_entity }
       end
     end
    
  end

  # POST /person_infos
  # POST /person_infos.json
  def create

   logger.info "WE ARE IN THE CREATE FUNCTION "
       
    # @person_info = PersonInfo.new(person_info_params)
     
      
     @password = params[:person_info][:users_attributes]['0'][:password]
     @role_id =  params[:person_info][:users_attributes]['0'][:role_id]
     @contact = params[:person_info][:person_contact_infos_attributes]['0'][:contact_number]
     @surname = person_info_params[:surname]
     @other_names = person_info_params[:other_names]
     @person_type_id = person_info_params[:person_type_id]
    @user_id =  person_info_params[:user_id]
    @active_status =  person_info_params[:active_status]
    @del_status = person_info_params[:del_status]
    @dob = person_info_params[:dob]
    @pd_sub = person_info_params[:pd_sub]
    @suburb_id = params[:person_info][:person_contact_infos_attributes]['0'][:suburb_id]
     @email = params[:person_info][:person_contact_infos_attributes]['0'][:email]
     @user_type = person_info_params[:person_type_id]
     @dob  = person_info_params[:dob]

     logger.info "--------person_info_params #{person_info_params}"
        logger.info "--------SURNAME #{@surname}"
             logger.info "--------EMAIL #{@email}"

             @person_info = PersonInfo.new({:surname => @surname,:other_names => @other_names,:person_type_id => @person_type_id,:user_id => @user_id,:active_status => @active_status,:del_status=> @del_status,:dob=> @dob,:pd_sub=> @pd_sub, person_contact_infos_attributes: [ :contact_number => @contact,:email => @email,:suburb_id => @suburb_id],users_attributes: [:password => @password , :role_id => @role_id]})

               logger.info "--------"
     Rails.logger.info(@person_info.errors.messages.inspect)
       logger.info "--------"
  #  @info.save

  #  "users_attributes"=>{"0"=>{"email"=>"admin2@gmail.com", "password"=>"12341234", "password_confirmation"=>"12341234", "active_status"=>"", "del_status"=>"", "role_id"=>"1"}}}
     
     tel_ext = @contact[0..2].to_s
     
     if tel_ext == '024' or tel_ext == '054' or tel_ext == '055'
       @telco = 'MTN'
     elsif tel_ext == '027' or tel_ext == '057' 
       @telco = 'TIG'
     elsif tel_ext == '026' or tel_ext == '056'
       @telco = 'AIR'
     elsif tel_ext == '020' or tel_ext == '050'
       @telco = 'VOD'
     end
     
     
     @encrypted_password = Digest::SHA256.hexdigest(@password)
     
        
     respond_to do |format|
       if @person_info.save
          
       login_details= PasswordTable.new(
            password: @encrypted_password,
            mobile_number: @contact,
            email: @email,
            status: false
          )
         
         if login_details.save!
           
            reg_details = Registration.new(
              surname:  @surname,
              other_names: @other_names,
              mobile_number: @contact,
              password: @encrypted_password,
              status: true,
              telco: @telco,
              src:  'PTL',
              verified: true,
              user_id: current_user.id,
              email: @email,
              user_type: @user_type,
              dob: @dob
            )
           
           if reg_details.save
           
             format.js { flash.now[:notice] = "Personnel was successfully created." }
             format.html { redirect_to @person_info, notice: 'Person info was successfully created.' }
             format.json { render :show, status: :created, location: @person_info }
           end
           
         end
         
         
       else
         @person_type_masters = PersonTypeMaster.all
         format.js { render :new }
         format.js { flash.now[:notice] = "Fields with * are required" }
         format.html { render :new }
         format.json { render json: @person_info.errors, status: :unprocessable_entity }
       end
     end
    ##createUser
  end

 

 

  # PATCH/PUT /person_infos/1
  # PATCH/PUT /person_infos/1.json
  def update
    @person_type_masters = PersonTypeMaster.all
    @user = User.find_by_person_id(params[:id])
    logger.info "The selected user -s #{@user.inspect}"
    respond_to do |format|
      if @person_info.update(person_info_params)
        format.js { flash.now[:notice] = "Personnel was successfully updated." }
        format.html { redirect_to current_user, notice: 'Person info was successfully updated.' }
        format.json { render :show, status: :ok, location: @person_info }
      else
        @person_type_masters = PersonTypeMaster.all
        format.js {render :edit}
        format.html { render :edit }
        format.json { render json: @person_info.errors, status: :unprocessable_entity }
      end
    end
  end 
  
  def update_profile
      @person_type_masters = PersonTypeMaster.all
      @user_id = current_user.id
      @user = User.find(@user_id)
      @person_id = @user.person_id
      @person_info = PersonInfo.find(@person_id)
      
      respond_to do |format|
        if @person_info.update(person_info_params)
          format.js { flash.now[:notice] = "Personnel was successfully updated." }
          format.html { redirect_to current_user, notice: 'Person info was successfully updated.' }
          format.json { render :show, status: :ok, location: @person_info }
        else
          @person_type_masters = PersonTypeMaster.all
          format.js {render :edit_profile}
          format.html { render :edit }
          format.json { render json: @person_info.errors, status: :unprocessable_entity }
        end
    end
      
  end

  # DELETE /person_infos/1
  # DELETE /person_infos/1.json
  def destroy
    @person_info.destroy
    respond_to do |format|
      format.html { redirect_to person_infos_url, notice: 'Person info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_info 
      @person_info = PersonInfo.find(params[:id]) 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_info_params
      params.require(:person_info).permit(:surname, :other_names, :person_type_id, :entity_id, :user_id, :active_status, :del_status, :full_name, :dob, :pd_sub, :reg_id,  person_contact_infos_attributes: [ :id, :person_id, :contact_number, :email, :postal_address, :location_address, :comment, :user_id, :entity_id, :active_status, :del_status, :suburb_id, :_destroy ], users_attributes: [:id, :person_id, :email, :password, :password_confirmation, :profile, :profile_file_name, :profile_content_type, :profile_file_size, :profile_updated_at, :active_status, :del_status, :role_id ]   ) 
    end
end 
