
class PersonInfoExtrasController < ApplicationController
  before_action :set_person_info_extra, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

respond_to :html, :json, :js
#   load_and_authorize_resource
   # before_action :authenticate_user!
 #  before_filter :load_permissions

  # GET /person_info_extras
  # GET /person_info_extras.json
  def index
    @person_info_extras = PersonInfoExtra.all
  end

  # GET /person_info_extras/1
  # GET /person_info_extras/1.json
  def show
  end

  # GET /person_info_extras/new
  def new    
    @person_info_extra = PersonInfoExtra.new
    @person_id = params[:person_id]
    session[:person_id] = @person_id
    logger.info "Person id is #{@person_id.inspect}"
    
    @specialty_masters = SpecialtyMaster.order(:title).where("title like ?", "%#{params[:specialty_id]}")
   
    @the_list = @specialty_masters.map { |a|[a.title+" ",a.id]  }
    
    @professional_groups = ProfesionalGroup.order(:group_name).where("group_name like ?", "%#{params[:profession_group_id]}")
    @group = @professional_groups.map { |a|[a.group_name+" ",a.id]  }
    
  end

  # GET /person_info_extras/1/edit
  def edit
      
  end
  
  def edit_prof_details
    @person_id = params[:person_id]
    session[:person_id] = @person_id
    @person_info_extra = PersonInfoExtra.where(person_id: @person_id)[0] 
     @specialty_masters = SpecialtyMaster.order(:title).where("title like ?", "%#{params[:specialty_id]}")
   
     @the_list = @specialty_masters.map { |a|[a.title+" ",a.id]  }
    
    @professional_groups = ProfesionalGroup.order(:group_name).where("group_name like ?", "%#{params[:profession_group_id]}")
    @group = @professional_groups.map { |a|[a.group_name+" ",a.id]  }
  end
  

  def find_prof_info
    @person_id = params[:person_id]
    logger.info "person id is #{@person_id.inspect}"
    @person_info_extra = PersonInfoExtra.where(person_id: @person_id)[0] 
    logger.info "Person is #{@person_info_extra.inspect}"
    @person_contact_info = PersonContactInfo.where(person_id: @person_id)[0]
    
    @type = @person_contact_info.person_info.person_type_master.user_type_title
    logger.info "Type is #{@type.inspect}"
    
    logger.info "Person contact info is #{@person_contact_info.inspect}"
    
    
    if @person_info_extra.nil?
       flash.now[:notice] = "Sorry the personnel doesn't have any professional information."

    end
      
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
     
     
      
     # @person_info = PersonInfo.new
      # @person_type_masters = PersonTypeMaster.all
#      
     # @reg_id = params[:reg_id]
     # @reg = Registration.find(@reg_id)
#      
     # logger.info "Reg id is #{@reg_id.inspect}"
     # logger.info "Reg is #{@reg.inspect}"
     # session[:reg_id] = @reg_id
#      
     # logger.info "session stored #{session[:reg_id]}"
     # # details
     # @surname = @reg.surname
     # @other_names = @reg.other_names
     # @ref_id = @reg.user_type
     # @contact = @reg.mobile_number

     # @dob = @reg.dob
     # @email = @reg.email
     # @user_unique_code = @reg.user_uniq_code 
     # @pd_sub = @reg.pd_sub
     # logger.info "Unique code is  #{@user_unique_code.inspect}"
#       
      # logger.info "pd_sub is #{@pd_sub.inspect}"
#       
     # @person_type = PersonTypeMaster.find(@ref_id)
#     
     # logger.info "person type is #{@person_type.inspect}"
     # @person_type = @person_type.user_type_title
#      
      # logger.info "User role is #{@person_type}" 
#      
      # @user_roles = Role.find_by_name(@person_type)
      # logger.info "User role role role is #{@user_roles.inspect }"
#       
      # @final_role = @user_roles.name
      # logger.info "Final role is #{@final_role.inspect}"
#       
#      
# #       
     # # if @ref_id == 'D'
       # @suburb_id = @reg.surburb_id      
     # # end
# #      
# 
     # logger.info "################################"
     # logger.info "This is the suburb id #{@suburb_id}"
       
     # logger.info "################################"
     # # @user_type_ref = PersonTypeMaster.where(ref_id: @ref_id)[0]
     # # logger.info "Reg id is #{@user_type_ref.inspect}"
     # # @user_type = @user_type_ref.user_type_title
     # # logger.info "User type is #{@user_type.inspect}"
#      
     # @person_info.person_contact_infos.build
     # @person_info.users.build
     
     
     
  end
  
  
  
  
   # //user confirmation action
  def confirm_person_registration
     @person_id = params[:person_id]
     @user_id = params[:user_id]
     @reg_id = params[:reg_id]
     logger.info "Person_id is #{@person_id.inspect}"
     logger.info "And user id is  #{@user_id.inspect}"

     @person_info_extra = PersonInfoExtra.new(person_info_extra_params)
     person_info = PersonInfo.find(@person_id)
     person_contact_info = PersonContactInfo.where(person_id: @person_id, active_status: true, del_status: false)[0]


     respond_to do |format|
      if @person_info_extra.save
        @reg = Registration.find(@reg_id)
        logger.info "Registration DETAILS !!!!!! #{@reg.inspect}" 
	
      #attr_update = @reg.update_attributes(:verified => true, :user_id => current_user.id)
      attr_update = @reg.update(:verified => true, :user_id => current_user.id)
      Rails.logger.info(@reg.errors.messages.inspect)
      logger.info "ATTR UPDATED #{attr_update}"	

        if @reg.update_attributes(:verified => true, :user_id => current_user.id)
         logger.info "CHECKING--"
         
            @user = User.where(person_id: @person_id)[0]
          if @user.update_attribute('active_status', true)
            person_info.update_attribute('user_id', current_user.id)
            person_contact_info.update_attributes(:user_id => current_user.id, :postal_address => "", :location_address => "")
            
          #  format.js
            format.js { flash.now[:notice] = "Professional Confirmed Successfully" }
            format.html { redirect_to @person_info_extra, notice: 'Person info extra was successfully created.' }
         #   format.json { render :show, status: :created, location: @person_info_extra }
          end

	else
	logger.info "CHECKING TWO ---------------"
 format.html { redirect_to @person_info_extra, notice: 'Person info extra was successfully created.' }

		 format.js { flash.now[:notice] = "Professional Confirmed Successfully" }

        end



      else
	logger.info "IN THE ELSE FUNCTION"
        @reg = Registration.find(@reg_id)
        @person_info = PersonInfo.where(reg_id: @reg_id)[0]

        @person_id = @person_info.id
        @user = User.where(person_id: @person_id)[0]
        @user_id = @user.id

        @specialty_masters = SpecialtyMaster.order(:title).where("title like ?", "%#{params[:specialty_id]}")

        @the_list = @specialty_masters.map { |a|[a.title+" ",a.id]  }

        @professional_groups = ProfesionalGroup.order(:group_name).where("group_name like ?", "%#{params[:profession_group_id]}")
        @group = @professional_groups.map { |a|[a.group_name+" ",a.id]  }

        #format.js { render :new_confirm_person_info }
        format.html { render :new }
        #format.json { render json: @person_info_extra.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /person_info_extras
  # POST /person_info_extras.json
  def create
    @person_info_extra = PersonInfoExtra.new(person_info_extra_params)

    respond_to do |format|
      if @person_info_extra.save
        session.delete(:person_id)
        format.js { flash.now[:notice] = "Professional information successfully added." }
        format.html { redirect_to @person_info_extra, notice: 'Person info extra was successfully created.' }
        format.json { render :show, status: :created, location: @person_info_extra }
      else     
        @person_id = session.delete(:person_id)
        logger.info "Person id is #{@person_id.inspect}"
        
        @specialty_masters = SpecialtyMaster.order(:title).where("title like ?", "%#{params[:specialty_id]}")
   
        @the_list = @specialty_masters.map { |a|[a.title+" ",a.id]  }
        
        @professional_groups = ProfesionalGroup.order(:group_name).where("group_name like ?", "%#{params[:profession_group_id]}")
        @group = @professional_groups.map { |a|[a.group_name+" ",a.id]  }
        
        format.js { render :new }
        format.html { render :new }
        format.json { render json: @person_info_extra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_info_extras/1
  # PATCH/PUT /person_info_extras/1.json
  def update
    respond_to do |format|
      if @person_info_extra.update(person_info_extra_params)
        session.delete(:person_id)
        format.js { flash.now[:notice] = "Professional information successfully updated." }
        format.html { redirect_to @person_info_extra, notice: 'Person info extra was successfully updated.' }
        format.json { render :show, status: :ok, location: @person_info_extra }
      else
        @person_id = session.delete(:person_id)
        logger.info "Person id is #{@person_id.inspect}"
        @person_info_extra = PersonInfoExtra.where(person_id: @person_id)[0] 
        @specialty_masters = SpecialtyMaster.order(:title).where("title like ?", "%#{params[:specialty_id]}")
   
        @the_list = @specialty_masters.map { |a|[a.title+" ",a.id]  }
        
        @professional_groups = ProfesionalGroup.order(:group_name).where("group_name like ?", "%#{params[:profession_group_id]}")
        @group = @professional_groups.map { |a|[a.group_name+" ",a.id]  }
        
        format.js { render :edit_prof_details }
        format.html { render :edit }
        format.json { render json: @person_info_extra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_info_extras/1
  # DELETE /person_info_extras/1.json
  def destroy
    @person_info_extra.destroy
    respond_to do |format|
      format.html { redirect_to person_info_extras_url, notice: 'Person info extra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_info_extra
      @person_info_extra = PersonInfoExtra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_info_extra_params
      params.require(:person_info_extra).permit(:person_id, :specialty_id, :specialty_duration, :has_specialty, :forign_training, :foreign_institution_desc, :profession_group_id, :licence_number, :comment, :user_id, :entity_id, :active_status, :del_status, :foreign_licence_number, :hospital_name)
    end
end
