class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]
   #before_action :authenticate_user!
   #load_and_authorize_resource
   #before_filter :load_permissions
   
  
   # attr_accessor :password_confirmation
  
  # GET /registrations
  # GET /registrations.json
  
require 'twilio-ruby'

  require 'json'
  require 'faraday'
  require 'openssl'
  require 'uri'
  require 'net/http'

  def sendmsg(phone,msg)

      account_sid = 'AC2327f6201a02298610e5cc6df9b4b7e2'
      auth_token = 'ef45f23889f7730e8af70c5328db5d52'
      @client = Twilio::REST::Client.new(account_sid, auth_token)
      
      from = 'Ghinger' # Your Twilio number
      to = validatePhoneNumber(phone) # Your mobile phone number
      @client.messages.create(
      from: from,
      to: to,
      body: msg
      )
      
      
      end

      CTRYCODE = '+233'.freeze
      CTRYCODES = '+'.freeze
      
      def validatePhoneNumber(mobile_number)
   puts "THE PHONE NUMBER IS "
   wildcard_search = "#{mobile_number}"
  puts  wildcard_search
   puts "THE PHONE NUMBER LENGHT"
  puts  wildcard_search.length
 puts "--------------------------"
   if wildcard_search[0..2]=='233' && wildcard_search.length==12
     puts wildcard_search=CTRYCODE+"#{wildcard_search[3..wildcard_search.length]}"
   elsif wildcard_search[0..5]=='233' && wildcard_search.length==12
     puts wildcard_search=CTRYCODE+"#{wildcard_search[3..wildcard_search.length]}"
   elsif wildcard_search[0]=='0' && wildcard_search.length==10
     puts "RUN THIS -------"
     puts wildcard_search = CTRYCODE+"#{wildcard_search[1..wildcard_search.length]}"
   elsif wildcard_search[0]=='0' && wildcard_search.length>10
     puts "RUN THIS IF ITS  STRING AND HAS more THAN 10  -------"
     puts wildcard_search = CTRYCODE+"#{wildcard_search[1..wildcard_search.length]}"
   elsif  wildcard_search.length==10
     puts "RUN THIS IF IS NOT A TRING-------"
     puts wildcard_search = CTRYCODE+"#{wildcard_search[1..wildcard_search.length]}"
   elsif wildcard_search[0] == '+' && wildcard_search[1..3] == '233'&& wildcard_search[4..wildcard_search.length].length == 9
     puts wildcard_search = CTRYCODE+"#{wildcard_search[4..wildcard_search.length]}"
   elsif wildcard_search[0] != "+" && wildcard_search[0..2]!='233' && wildcard_search.length == 9
     puts wildcard_search=CTRYCODE+"#{wildcard_search[0..wildcard_search.length]}"
    elsif wildcard_search[0] != "+" && wildcard_search[0..5]!='233' && wildcard_search.length == 9
     puts wildcard_search=CTRYCODE+"#{wildcard_search[0..wildcard_search.length]}"
   elsif wildcard_search[0..1]=='00'
     puts  wildcard_search=CTRYCODES+"#{wildcard_search[2..wildcard_search.length]}"
   end
   
   return wildcard_search
end

  
  
  def index
    @pending_registrations = Registration.where(verified: false,status: 1).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
    
    @approved_registrations = Registration.where(verified: true, status: 1).paginate(:page => params[:page], :per_page => 10).order('updated_at desc')
    
    logger.info "Approved Registrations are #{@approved_registrations.inspect}"
    @registrations = Registration.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
  
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
      @per_page = params[:per_page] || Registration.per_page || 10
      @pending_registrations = Registration.where(verified: false,status: 1).paginate( :per_page => @per_page, :page => params[:page])
      @approved_registrations = Registration.where(verified: true, status: 1).paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || Registration.per_page || 10
   page = if params[:page]
            params[:page].to_i
           else
            1
           end
   

         
# Filter 
if params[:provider_name]
  @provider_name = params[:provider_name]  
  logger.info "The provider is #{@provider_name.inspect}"
  @pre_appointments = PreAppointment.joins(:provider_master).where(provider_masters: {provider_name: @provider_name}).paginate( :page => params[:page], :per_page => 5).order('created_at desc')   

elsif params[:category]
  @category = params[:category]
  logger.info "The category is #{@category.inspect}"
  @pre_appointments = PreAppointment.joins(:request_category).where(request_categories: {category: @category}).paginate( :page => params[:page], :per_page => 5).order('created_at desc')

elsif params[:title]
  @type = params[:title]
  logger.info "The type is #{@type.inspect}"
  @pre_appointments = PreAppointment.joins(:appointment_type).where(appointment_types: {title: @type}).paginate( :page => params[:page], :per_page => 5).order('created_at desc')

end
   
    
    respond_to do |format|
      logger.info "what is the url calling this??: ans #{request.referer}"
      format.js
      format.html
    end
     
  end
 
 
 def pending_registrations
   @pending_registrations = Registration.where(verified: false,status: 1).paginate(:page => params[:page], :per_page => 10).order('id desc')
   
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
      @per_page = params[:per_page] || Registration.per_page || 10
      @pending_registrations = Registration.where(verified: true,status: 1).paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || Registration.per_page || 10
   page = if params[:page]
            params[:page].to_i
           else
            1
           end
   
   
   respond_to do |format|
     format.html
     format.js
     format.csv { send_data @pending_registrations.to_csv}
     format.xls { send_data @pending_registrations.to_csv(options={col_sep: "\t"})}
   end
 end
 
 def all_pending_registration_excel
    @pending_registrations = Registration.where(verified: false,status: 1).order('id desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @pending_registrations.to_csv }
      format.xls { send_data @pending_registrations.to_csv(options={col_sep: "\t"}) }
    end
  end
  
  def approved_registrations
   @approved_registrations = Registration.where(verified: true,status: 1).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
   
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
      @per_page = params[:per_page] || Registration.per_page || 10
      @approved_registrations = Registration.where(verified: true,status: 1).paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || Registration.per_page || 10
   page = if params[:page]
            params[:page].to_i
           else
            1
           end
   
   
   
   
   respond_to do |format|
     format.html
     format.js
     format.csv { send_data @approved_registrations.to_csv}
     format.xls { send_data @approved_registrations.to_csv(options={col_sep: "\t"})}
   end
 end
 
 def all_approved_registration_excel
    @approved_registrations = Registration.where(verified: true,status: 1).order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @approved_registrations.to_csv }
      format.xls { send_data @approved_registrations.to_csv(options={col_sep: "\t"}) }
    end
  end
 
  
  
  def enable_pending_reg
      reg_id=params[:chosen]
      reg = Registration.find(reg_id)
     if reg.update(:status => 1)
       redirect_to registrations_path, notice: 'Pending registration was successfully enabled.'
     end
  end
 
  def disable_pending_reg
      reg_id=params[:chosen]
      
      reg = Registration.find(reg_id)
      
     if reg.update(:status => 0)
       redirect_to registrations_path, notice: 'Pending registration was successfully disabled.'
     end    
  end
  
  
   def enable_approved_reg
      reg_id=params[:chosen]
      reg = Registration.find(reg_id)
     if reg.update(:status => 1)
       @approved_registrations = Registration.where(verified: true,status: 1).paginate(:page => params[:page], :per_page => 10).order('id desc')
       flash.now[:notice] = "Approved registration was successfully enabled."
       # redirect_to registrations_path, notice: 'Approved registration was successfully enabled.'
     end
  end
 
  def disable_approved_reg
      reg_id=params[:chosen]
      
      reg = Registration.find(reg_id)
      
     if reg.update(:status => 0)
       @approved_registrations = Registration.where(verified: true).paginate(:page => params[:page], :per_page => 10).order('id desc')
       flash.now[:notice] = "Approved registration was successfully disabled."
       # redirect_to registrations_path, notice: 'Approved registration was successfully disabled.'
     end    
  end
  
  

  def approve_registration
    # @pending_registrations = Registration.where(verified: false).paginate(:page => params[:page], :per_page => 5).order('id desc')
    # @approved_registrations = Registration.where(verified: true).paginate(:page => params[:page], :per_page => 5).order('id desc')
  
    reg_id = params[:reg_id]
    logger.info "Registration id is #{reg_id.inspect}"
    selected_reg = Registration.find(reg_id)
    logger.info "#######################SELECTED REG IS ############# #{selected_reg.inspect}"
    done = false #if its successful
    
    if selected_reg
      user_type = selected_reg.user_type
      logger.info "#######################SELECTED USER TYPE IS ############# #{user_type.inspect}"
      
      person_info = PersonInfo.new(
                     surname:    selected_reg.surname,
                     other_names: selected_reg.other_names,
                     person_type_id: user_type, 
                     reg_id: selected_reg.id,
                     pd_sub: true,
                     active_status: true,
                     del_status: false
                   )
                   
      if person_info.save!
         person_id = person_info.id
         
         contact_info = PersonContactInfo.new(
                        person_id: person_id,
                        contact_number: selected_reg.mobile_number,
                        email: selected_reg.email,
                        suburb_id: selected_reg.surburb_id,
                        active_status: true,
                        del_status: false
                       )
            logger.info "This is the current user id number #{current_user.id.inspect}"     
            # if contact_info.save!
#                 
            # end  
          
         if contact_info.save!
            selected_reg.update(
                   verified: true,
                   user_id: current_user.id
                  )
              selected_reg.save!
              done = true
          else
              done = false
              # break #break if there's a problem
         end
         
      end
          
    end
    
    respond_to do |format|
      if done
        format.js {flash.now[:notice] = "Registration approved successfully."}
        format.html { redirect_to @registration, notice: 'Registration was successfully created.' }
        format.json { render :show, status: :created, location: @registration }
      else
        format.js {flash.now[:notice] = "Sorry the application was not processed."}
        format.html { render :new }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
    
    
    
  end

  


  

  # GET /registrations/1
  # GET /registrations/1.json
  def show
    # @user_type = session.delete(:user_type)
    # respond_to do |format|
      # format.js
      # flash.now[:notice] = "Registration successful!"
    # end
    
  end
  
  
  def get_location
    @registration = Registration.new
    @countries = CountryMaster.order(:country_name).where("country_name like ?", "%#{params[:surburb_id]}" )
    @country_list = @countries.map { |a|[a.country_name+" ",a.id]  }
    logger.info "Countries: #{@countries.inspect}"
    logger.info "Mapping: #{@country_list.inspect}"
  end
  
  def find_regions
      country = CountryMaster.find(params[:country_id])
      logger.info "this is the country: #{country.inspect}"

      logger.info "regions in country: #{country.region_masters.inspect}"
      @regions = country.region_masters.map{|a| [a.region_state_name, a.id]}.insert(0, "Choose your Region or State")
  end
  
  def find_cities_for_region
      region = RegionMaster.find(params[:region_id])
      logger.info "this is the country: #{region.inspect}"

      logger.info "cities in region: #{region.city_town_masters.inspect}"
      @cities = region.city_town_masters.map{|a| [a.city_town_name, a.id]}.insert(0, "Choose your City or Town")
  end
  
  def find_suburbs_for_city
     city = CityTownMaster.find(params[:city_id])
      logger.info "this is the country: #{city.inspect}"

      logger.info "suburbs in city: #{city.suburb_masters.inspect}"
      @suburbs = city.suburb_masters.map{|a| [a.suburb_name, a.id]}.insert(0, "Choose the Closest Suburb")   
  end
  
  
  def get_location_process
    @suburb_id = params[:suburb_id]
    
    respond_to do |format|
      format.js {redirect_to new_registration_path(:suburb_id => @suburb_id)}
    end
    
    # redirect_to new_registration_path
  end


  # GET /registrations/new
  def new  
    @registration = Registration.new
    @minimum_password_length = 6
    @city = CityTownMaster.where(active_status: true,change_status: false)
    @suburb_masters = SuburbMaster.order(:suburb_name).where("suburb_name like ?", "%#{params[:surburb_id]}" )
    @loc_list = @suburb_masters.map { |a|[a.suburb_name+" ",a.id]  }
    @suburb_id = params[:suburb_id]
  end

  # GET /registrations/1/edit
  def edit
  end
  
  def process_registration  
      @city = CityTownMaster.where(active_status: true,change_status: false)
      @suburb_masters = SuburbMaster.order(:suburb_name).where("suburb_name like ?", "%#{params[:surburb_id]}" )
      @loc_list = @suburb_masters.map { |a|[a.suburb_name+" ",a.id]  }
      logger.info "##################"
      logger.info "##################"
      logger.info "##################"
     logger.info @suburb_id = params[:suburb_id]
      
      @pass = registration_params[:password]
      @pass_confirm = registration_params[:password_confirmation]
      
      # logger.info "Password is #{@pass.inspect}"
      # logger.info "Password confirmation is #{@pass_confirm.inspect}"
      
     
       telco = registration_params[:mobile_number]
       logger.info "##################"
       logger.info "##################"
       logger.info "##################"
     logger.info @suburb_id = registration_params[:surburb_id]
    
      tel_ext = telco[0..2].to_s
      
      # logger.info "Telco extension #{@pass_confirm.inspect}"
       
       if tel_ext == '024' or tel_ext == '054' or tel_ext == '055'
         @telco = 'MTN'
       elsif tel_ext == '027' or tel_ext == '057' 
         @telco = 'TIG'
       elsif tel_ext == '026' or tel_ext == '056'
         @telco = 'AIR'
       elsif tel_ext == '020' or tel_ext == '050'
         @telco = 'VOD'
       else
         @telco = 'UNKNOWN' 
       end
       
       # logger.info "this is the telco #"
     
     # if @pass == @pass_confirm
     
     if @pass != ''
       if @pass.length >= 6
          @encrypted = Digest::SHA256.hexdigest(@pass)
       end
     end  
     
     
     
        @registration = Registration.new(
          surname: registration_params[:surname],
          other_names:  registration_params[:other_names],
          email:  registration_params[:email],
          user_type:  registration_params[:user_type],
          mobile_number:  registration_params[:mobile_number],
          password: @encrypted,
          status: true,
          telco: @telco,
          verified: false,
          src: 'WEB',
          user_uniq_code: @pass, 
          dob:  registration_params[:dob],
          surburb_id: @suburb_id,
          pd_sub: registration_params[:pd_sub],
          hospital_name:  registration_params[:hospital_name]
        )
        

        
       respond_to do |format|
        if @registration.save
          logger.info "----PERSregistration #{@registration.inspect}" 
          @password_table = PasswordTable.new(
            password: @registration.password,
            mobile_number: @registration.mobile_number,
            status: true,
            email: @registration.email
          )
          
          if @password_table.save
             @reg_id = @registration.id
              # if registration_params[:user_type] == 'C'
                   
                    @person_info = PersonInfo.new(
                       surname: @registration.surname,
                       other_names: @registration.other_names,
                       #dob: registration_params[:dob],
                       person_type_id: @registration.user_type,
                       active_status: true,
                       del_status: false, 
                       reg_id: @reg_id,
                       pd_sub: @registration.pd_sub
                     )
                    # @person_info.save!
                     logger.info "----PERSON ID ID #{@person_info.inspect}"

                    
                  
                  if @person_info.save
                     logger.info "----PERSON ID ID #{@person_info.inspect}"
                       @person_id = @person_info.id
                       @person_contact_info = PersonContactInfo.new(
                          person_id: @person_id,
                          email:  registration_params[:email],
                          contact_number: registration_params[:mobile_number],
                          active_status: true,
                          del_status:  false                         
                        )                     
                   end 

                  if @person_contact_info.save
                    @user_type = registration_params[:user_type]
                    # get uset_type_title from person_type_master
                    user_type_row = PersonTypeMaster.where(ref_id: @user_type)[0]
                    user_type_title = user_type_row.user_type_title
                    
                    # use user_type_title to fetch role_id from roles table
                    role = Role.where(name: user_type_title)[0]
                    role_id = role.id
                    
                      if registration_params[:user_type] == 'C'
                        @person_id = @person_info.id
                          @user = User.new(
                             role_id: role_id,
                             email: registration_params[:email],
                             password: @pass,
                             person_id: @person_id,
                             active_status: true,
                             del_status: false
                         )  
                         
                         if @user.save
                             @registration.update_attribute(
                                'verified', true
                             )                    
                           # format.js  
                           # flash.now[:notice] =  "Registration was successful."
                         end

                         logger.info "----------------"
                         logger.info "----------------"
                         logger.info "----------------"
                         logger.info "----------------"
                         logger.info  @user.inspect
                         
                      elsif  registration_params[:user_type] != 'C'
                        @person_id = @person_info.id
                         @user = User.new(
                             role_id: role_id,
                             email: registration_params[:email],
                             password: @pass,
                             person_id: @person_id,
                             active_status: false,
                             del_status: false
                         )  
                         
                         @user.save
                                                   
                      end
                    
                                                                           
                   end
                 
                  
                 
              # elsif  registration_params[:user_type] != 'C'  
                # # logger.info "Reg id #{@reg_id.inspect}"
                  # # format.js   
                  # # flash.now[:notice] =  "Registration was successful."        
              # end
#                
          end
          #format.js { render :show }

          flash.now[:notice] =  "Registration was successful." 
          #phone_numbers = validatePhoneNumber(@registration.mobile_number)
          #message = "Thanks for registrating with us, Ghinger support will approve your account shortly."
          #logger.info message.inspect
          #logger.info sendmsg(phone_numbers,message)
          format.html { redirect_to root_path, notice: "Registration was successfully." }
          format.json { render :show, status: :created, location: @registration }
        else
          format.html { render :new }
          flash.now[:notice] =  "Registration failed." 
          #format.js { render :new } 
          format.json { render json: @registration.errors, status: :unprocessable_entity }
          @minimum_password_length = 6
          # @suburb_masters = SuburbMaster.order(:suburb_name).where("suburb_name like ?", "%#{params[:surburb_id]}" )
          # @loc_list = @suburb_masters.map { |a|[a.suburb_name+" ",a.id]  }
          # @suburb_id
        end
      end
   
    # end

  end
  
  
  def  user_prof_info
    @registration = Registration.new
    
    @reg_id = params[:reg_id].to_i
    logger.info "The reg Id is still #{@reg_id.inspect}"
    @specialty_masters = SpecialtyMaster.order(:title).where("title like ?", "%#{params[:specialty_id]}")
   
    @the_list = @specialty_masters.map { |a|[a.title+" ",a.id]  }
    
    @professional_groups = ProfesionalGroup.order(:group_name).where("group_name like ?", "%#{params[:professional_group_id]}")
    @group = @professional_groups.map { |a|[a.group_name+" ",a.id]  }
    
    # get usertype
    @reg = Registration.find(@reg_id)
    @user_type = @reg.user_type
    
  end
  
  def process_user_prof_info
    @reg_id = params[:reg_id].to_i
    logger.info "The reg Id is still still #{@reg_id.inspect}"
    @registration = Registration.find_by_id(@reg_id)
    logger.info "Registration #{@registration.inspect}"
    
    @update_reg = @registration.update(
       specialty_id: registration_params[:specialty_id],
       specialty_duration: registration_params[:specialty_duration],
       has_specialty:  registration_params[:has_specialty],
       foreign_training:  registration_params[:foreign_training],
       foreign_institution: registration_params[:foreign_institution],
       professional_group_id: registration_params[:professional_group_id],
       licence_number: registration_params[:licence_number],
       foreign_licence_number: registration_params[:foreign_licence_number],
       hospital_name: registration_params[:hospital_name]
    )
    
    respond_to do |format|     
        if @update_reg == true
          format.js 
          flash.now[:notice] = "Prefessional Information submitted"
          
        else
          format.js {render :user_prof_info}
          @reg_id = params[:reg_id].to_i
          logger.info "wrong inputs #{@reg_id.inspect}"
       
          @specialty_masters = SpecialtyMaster.order(:title).where("title like ?", "%#{params[:specialty_id]}")
         
          @the_list = @specialty_masters.map { |a|[a.title+" ",a.id]  }
          
          @professional_groups = ProfesionalGroup.order(:group_name).where("group_name like ?", "%#{params[:professional_group_id]}")
          @group = @professional_groups.map { |a|[a.group_name+" ",a.id]  }
        end
      
    end
    
    
    
  end
  

  # POST /registrations
  # POST /registrations.json
  def create
      @pass = registration_params[:password]
      
      @encrypted = Digest::SHA256.hexdigest(@pass)

    telco = registration_params[:telco]
    
    tel_ext = telco[0..2].to_s
     
     if tel_ext == '024' or tel_ext == '054' or tel_ext == '055'
       @telco = 'MTN'
     elsif tel_ext == '027' or tel_ext == '057' 
       @telco = 'TIG'
     elsif tel_ext == '026' or tel_ext == '056'
       @telco = 'AIR'
     elsif tel_ext == '020' or tel_ext == '050'
       @telco = 'VOD'
     end
    
      @registration = Registration.new(
        surname: registration_params[:surname],
        other_names:  registration_params[:other_names],
        email:  registration_params[:email],
        user_type:  registration_params[:user_type],
        mobile_number:  registration_params[:mobile_number],
        password: @encrypted,
        status: true,
        telco: @telco,
        verified: false,
        src: 'WEB'
      )
      
     respond_to do |format|
      if @registration.save
        format.html { redirect_to @registration, notice: 'Registration was successfully created.' }
        format.json { render :show, status: :created, location: @registration }
      else
        format.js { render :new }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
      
   
  end

  # PATCH/PUT /registrations/1
  # PATCH/PUT /registrations/1.json
  def update
    respond_to do |format|
      if @registration.update(registration_params)
        format.html { redirect_to @registration, notice: 'Registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @registration }
      else
        format.html { render :edit }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration.destroy
    respond_to do |format|
      format.html { redirect_to registrations_url, notice: 'Registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:surname, :other_names, :mobile_number, :password, :status, :telco, :src, :verified, :email, :user_type, :dob, :surburb_id, :password_confirmation, :pd_sub, :specialty_id, :specialty_duration, :has_specialty, :foreign_training, :foreign_institution, :professional_group_id, :licence_number, :foreign_licence_number, :hospital_name)
    end
    
end
