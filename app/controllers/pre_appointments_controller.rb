class PreAppointmentsController < ApplicationController
  before_action :set_pre_appointment, only: [:show, :edit, :update, :destroy]
  
  
  before_action :authenticate_user!
  # load_and_authorize_resource
  # before_filter :load_permissions
  
  # GET /pre_appointments
  # GET /pre_appointments.json
  def index
      @pre_appointments = PreAppointment.where(confirm_status: false, pre_confirm_status: false).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
      @confirmed_appointments = ConfirmedAppointment.all.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
      @confirmed_personal_doctor_services = ConfirmedPersonalDoctorService.all.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
      @pre_confirmed_appointments = PreConfirmedAppointment.select('DISTINCT ON ("pre_appointment_id") *').paginate(:page => params[:page], :per_page => 10).order('pre_appointment_id desc', 'created_at desc')
      # @provider_masters = ProviderMaster.all
      # @lab_detail_images = LabDetailImage.all
      
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
      @per_page = params[:per_page] || PreAppointment.per_page || 10
      @pre_appointments = PreAppointment.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   
   @per_page = params[:per_page] #|| PreAppointment.per_page || 10
   page = if params[:page]
            params[:page].to_i
           else
            1 
           end
   

         
# Filter 
if params[:provider_name]
  @provider_name = params[:provider_name]  
  logger.info "The provider is #{@provider_name.inspect}"
  @pre_appointments = PreAppointment.joins(:provider_master).where(provider_masters: {provider_name: @provider_name}).paginate( :page => params[:page], :per_page => 10).order('created_at desc')

elsif params[:category]
  @category = params[:category]
  logger.info "The category is #{@category.inspect}"
  @pre_appointments = PreAppointment.joins(:request_category).where(request_categories: {category: @category}).paginate( :page => params[:page], :per_page => 10).order('created_at desc')

elsif params[:title]
  @type = params[:title]
  logger.info "The type is #{@type.inspect}"
  @pre_appointments = PreAppointment.joins(:appointment_type).where(appointment_types: {title: @type}, pre_appointments: {confirm_status: false}).paginate( :page => params[:page], :per_page => 10).order('created_at desc')

elsif params[:user_type_title]
  @person_type = params[:user_type_title]
  logger.info "Then person is #{@person_type.inspect}"
  @person_type_info = PersonTypeMaster.where(user_type_title: @person_type)
  @person_type_ref = @person_type_info.last.ref_id
  @pre_appointments = PreAppointment.joins(:person_info).where(person_infos: {person_type_id: @person_type_ref}).paginate( :page => params[:page], :per_page => 10).order('created_at desc')
end

if params[:patient]
  @pre_appointments = PreAppointment.patient_search(params[:patient]).paginate( :page => params[:page], :per_page => 10).order('created_at desc')
elsif params[:doctor]
  @pre_appointments = PreAppointment.doctor_search(params[:doctor]).paginate( :page => params[:page], :per_page => 10).order('created_at desc')
elsif params[:nurse]
  @pre_appointments = PreAppointment.nurse_search(params[:nurse]).paginate( :page => params[:page], :per_page => 10).order('created_at desc')
elsif params[:pharmacist]
  @person_infos = PersonInfo.pharmacist_search(params[:pharmacist]).paginate( :page => params[:page], :per_page => 10).order('created_at desc')
elsif params[:laboratorist]
  @person_infos = PersonInfo.laboratorist_search(params[:laboratorist]).paginate( :page => params[:page], :per_page => 10).order('created_at desc')
end


    respond_to do |format|
      logger.info "what is the url calling this??: ans #{request.referer}"
      format.js
      format.html
      format.csv { send_data @pre_appointments.to_csv(options = {}, page, perpage)}
      format.xls { send_data @pre_appointments.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    
    
  end
  
  
  def all_pre_appointment_excel
    @pre_appointments = PreAppointment.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @pre_appointments.to_csv }
      format.xls { send_data @pre_appointments.to_csv(options={col_sep: "\t"}) }
    end
  end

  # GET /pre_appointments/1
  # GET /pre_appointments/1.json   
  def show
    @person_infos = PersonInfo.where(:person_type_id => 'C')[0]
    @appointment_types = AppointmentType.all
    @lab_detail_images = LabDetailImage.all
     
  end 
  
  def create_order_show
    @pre_appointment_id = params[:pre_appointment_id]
    @patient_id = session.delete(:patient_id)
    @doctor_id  = session.delete(:doctor_id)
    
    @pre_appointment = PreAppointment.where(id: @pre_appointment_id)[0]
    @person_infos = PersonInfo.where(:person_type_id => 'C')[0]
    @appointment_types = AppointmentType.all
    @lab_detail_images = LabDetailImage.all
  end
  
  
  def place_order
    @patient_id = params[:patient_id] 
    @doctor_id = params[:doctor_id] 
    
    @patient_loc = PersonContactInfo.where(person_id: @patient_id )[0]
    @patient_loc_id = @patient_loc.suburb_id
    
    @pre_appointment = PreAppointment.new 
       
    @suburb_masters = SuburbMaster.order(:suburb_name).where("suburb_name like ?", "%#{params[:suburb_id]}" )     
    @provider_masters = ProviderMaster.order(:provider_name).where("provider_name like ?", "%#{params[:provider_id]}")
    
    @the_list = @provider_masters.map { |a|[a.provider_name+" ",a.id]  }
    @loc_list = @suburb_masters.map { |a|[a.suburb_name+" ",a.id]  }
    
    @requester = PersonInfo.where(:person_type_id => 'C')
     
    @appointment_types = AppointmentType.where("ref_id !=? and ref_id !=? and ref_id !=? and ref_id !=? and ref_id !=? and ref_id !=?", 'PD', 'MA', 'LA', 'VC', 'MD', 'HC')
    @request_urgencies = RequestUrgency.all
    @lab_services = LabService.all
    @lab_details = LabDetail.all
    @lab_details_list = LabDetail.joins(:lab_service).where("lab_details.pre_appointment_id = #{@pre_appointment_id} and lab_details.del_status = false")
    @lab_detail_images = LabDetailImage.all
    
    @pre_appointment.lab_details.build
    @pre_appointment.lab_detail_images.build
    
    # session[:patient_id] = @patient_id
    # session[:doctor_id] =  @doctor_id
    
  end
  
  
  
  

  # GET /pre_appointments/new
  def new
    @pre_appointment = PreAppointment.new 
    @suburb_masters = SuburbMaster.order(:suburb_name).where("suburb_name like ?", "%#{params[:suburb_id]}" )     
    @provider_masters = ProviderMaster.order(:provider_name).where("provider_name like ?", "%#{params[:provider_id]}")
    
    @the_list = @provider_masters.map { |a|[a.provider_name+" ",a.id]  }
    @loc_list = @suburb_masters.map { |a|[a.suburb_name+" ",a.id]  }
    
    @requester = PersonInfo.where(:person_type_id => 'C')
     
    @appointment_types = AppointmentType.all
    @request_urgencies = RequestUrgency.all
    @lab_services = LabService.all
    @lab_details = LabDetail.all
    @lab_details_list = LabDetail.joins(:lab_service).where("lab_details.pre_appointment_id = #{@pre_appointment_id} and lab_details.del_status = false")
    @lab_detail_images = LabDetailImage.all
    
    @pre_appointment.lab_details.build
    @pre_appointment.lab_detail_images.build
     
  end

  # GET /pre_appointments/1/edit
  def edit
     @provider_masters = ProviderMaster.order(:provider_name).where("provider_name like ?", "%#{params[:provider_id]}")
     @suburb_masters = SuburbMaster.order(:suburb_name).where("suburb_name like ?", "%#{params[:suburb_id]}" )     
     @the_list = @provider_masters.map { |a|[a.provider_name+" ",a.id]  }
     @loc_list = @suburb_masters.map { |a|[a.suburb_name+" ",a.id]  }
    
     @requester = PersonInfo.where(:person_type_id => 'C')
    
    @pre_appointment_id = params[:id]
    @appointment_types = AppointmentType.all
    @request_urgencies = RequestUrgency.all
    @lab_services = LabService.all
    @lab_details = LabDetail.all
    @lab_detail_images = LabDetailImage.all
    logger.info "Lab Details with the current pre appointment id #{@lab_details.inspect}"
    
    @lab_details_list = LabDetail.joins(:lab_service).where("lab_details.pre_appointment_id = #{@pre_appointment_id} and lab_details.del_status = false")
    # logger.info "Lab Details checked #{@lab_details.inspect}"
    logger.info "Lab Details list #{@lab_details_list.inspect}"
    @lab_details_list = @lab_details_list.map {|obj| obj.lab_service_id}
  
  end
  
   def enable_pre_appointment
      appointment_id=params[:chosen]
      pre_app = PreAppointment.where(id: appointment_id, confirm_status: false)[0]
      pre_app.skip_callbacks = true
     if pre_app.update_attribute('active_status', 1)
       #logger.info "--------------- #{pre_app.errors.inspect}-----------"
       #update(:active_status => 1)
       #logger.info "sql.................. #{pre_app.update_attribute('active_status', :active_status => 1).inspect}"
       redirect_to pre_appointments_path, notice: 'Appointment was successfully enabled.'
     end
     pre_app.skip_callbacks = false
   end
 
  def disable_pre_appointment
      appointment_id=params[:chosen]     
      pre_app = PreAppointment.where(id: appointment_id, confirm_status: false)[0]
      pre_app.skip_callbacks = true
     if pre_app.update_attribute('active_status', 0)
       #update!(:active_status => 0)
       redirect_to pre_appointments_path, notice: 'Appointment was successfully disabled.'
     end
      pre_app.skip_callbacks = false
     
  end
  
  
  def find_allergies
    @requester_id = params[:requester_id]
    @pre_appointment_id = params[:pre_appointment_id]
    @requester_allergies = RequesterAllergy.where(requester_id: @requester_id, del_status: false)
    @allergies_masters = AllergiesMaster.all
    logger.info "allery is : #{@requester_allergies.inspect}"
    logger.info "pre appointment id : #{@requester_id.inspect}"
    
    @requester_allergy = RequesterAllergy.where(requester_id: @requester_id, del_status: false)[0]
   
    if @requester_allergy.nil?
       flash.now[:notice] = "There are no allergies for this appointment at the moment."
    end 
    
  end
  


# process doctors order
 def process_order
   @pre_appointment = PreAppointment.new(pre_appointment_params)
   @doctor_id = pre_appointment_params[:user_id]
   @patient_id = pre_appointment_params[:requester_id]
   
   
    respond_to do |format|
      if @pre_appointment.save
        
        done = false #if it iterates successfully
        logger.info "allergies #{ params[:lab_service_id].inspect}"
        params[:lab_service_id].each do |key, value|
        if value.has_key?('checkbox')
          logger.info "value is: #{value}"
          group = LabDetail.new(
              pre_appointment_id: @pre_appointment.id,
              lab_service_id: value['id'].to_i,
              comment: '',
              user_id: '',
              active_status: true,
              del_status: false
          )
            if group.save!
                done = true
            else
                done = false
                break #break if there's a problem
            end
        end

      end
              
        format.js { flash.now[:notice] = "Appointment was successfully created." }
        format.html { redirect_to create_order_show_path(:pre_appointment_id => @pre_appointment.id ), notice: 'Pre appointment was successfully created.' }
        format.json { render :show, status: :created, location: @pre_appointment }
        
        session[:patient_id] = @patient_id
        session[:doctor_id] = @doctor_id
      else           
        # format.js { render :new }
        format.html { render :place_order }
        format.json { render json: @pre_appointment.errors, status: :unprocessable_entity }
        
          # @patient_id = session.delete(:patient_id)
          # @doctor_id = session.delete(:doctor_id)
          
          @patient_loc = PersonContactInfo.where(person_id: @patient_id )[0]
          @patient_loc_id = @patient_loc.suburb_id
          
             
          @suburb_masters = SuburbMaster.order(:suburb_name).where("suburb_name like ?", "%#{params[:suburb_id]}" )     
          @provider_masters = ProviderMaster.order(:provider_name).where("provider_name like ?", "%#{params[:provider_id]}")
          
          @the_list = @provider_masters.map { |a|[a.provider_name+" ",a.id]  }
          @loc_list = @suburb_masters.map { |a|[a.suburb_name+" ",a.id]  }
          
          @requester = PersonInfo.where(:person_type_id => 'C')
           
          @appointment_types = AppointmentType.where("ref_id !=?", 'PD')
          @request_urgencies = RequestUrgency.all
          @lab_services = LabService.all
          @lab_details = LabDetail.all
          @lab_details_list = LabDetail.joins(:lab_service).where("lab_details.pre_appointment_id = #{@pre_appointment_id} and lab_details.del_status = false")
          @lab_detail_images = LabDetailImage.all
          
          @pre_appointment.lab_details.build
          
          @pre_appointment.lab_detail_images.build
            
        
      end
    end
   
 end


   # FETCH LAB AND MD IMAGES
  def fetch_image
    @appt_type = params[:appt_type]
    pre_appt_id = params[:pre_apt_id]
    @src = params[:src]
    pic = LabImage.where(appointment_type_id: @appt_type, pre_appointment_id: pre_appt_id)[0]

    logger.info "SOURCE #{  @src}"
       logger.info "appt_type #{  @appt_type}"
    # link = PreAppointment.image_url

    if pic.present?
      # @image = "#{link}/#{@appt_type}/#{pic.file_name}"
        @image = "https://www.api.ghingerhealth.com/pictures/#{@appt_type}/#{pic.file_name}"

        logger.info "IMAGE #{@image}"
    else
      @image = nil
    end

  end
  
  # POST /pre_appointments
  # POST /pre_appointments.json
  def create
    @pre_appointment = PreAppointment.new(pre_appointment_params)
    
    respond_to do |format|
      if @pre_appointment.save
        
        done = false #if it iterates successfully
        logger.info "allergies #{ params[:lab_service_id].inspect}"
        params[:lab_service_id].each do |key, value|
        if value.has_key?('checkbox')
          logger.info "value is: #{value}"
          group = LabDetail.new(
              pre_appointment_id: @pre_appointment.id,
              lab_service_id: value['id'].to_i,
              comment: '',
              user_id: '',
              active_status: true,
              del_status: false
          )
            if group.save!
                done = true
            else
                done = false
                break #break if there's a problem
            end
        end

      end
              
        format.js { flash.now[:notice] = "Appointment was successfully created." }
        format.html { redirect_to @pre_appointment, notice: 'Pre appointment was successfully created.' }
        format.json { render :show, status: :created, location: @pre_appointment }
      else       
          @pre_appointments = ProviderMaster.order(:provider_name).where("provider_name like ?", "%#{params[:provider_id]}")
          @suburb_masters = SuburbMaster.order(:suburb_name).where("suburb_name like ?", "%#{params[:suburb_id]}" )
          @the_list = @pre_appointments.map { |a|[a.provider_name+" ",a.id]  }
          @loc_list = @suburb_masters.map { |a|[a.suburb_name+" ",a.id]  }
          
          @requester = PersonInfo.where(:person_type_id => 'C')
          @appointment_types = AppointmentType.all
          @request_urgencies = RequestUrgency.all
          @lab_services = LabService.all
          @lab_details = LabDetail.all
          
         @pre_appointment.lab_details.build
        format.js { render :new }
        format.html { render :new }
        format.json { render json: @pre_appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pre_appointments/1
  # PATCH/PUT /pre_appointments/1.json
  def update
     @pre_appointment_id = params[:id]
     group = LabDetail.find_by(pre_appointment_id: @pre_appointment_id, del_status: false) 
     
     if group
        group.del_status = true
        group.active_status = false
        group.save! #delete it and create new one
    end  
    respond_to do |format|
      if @pre_appointment.update(pre_appointment_params)
        
        if @pre_appointment.appointment_type_id == 'LA'
        
          done = false #if it iterates successfully          
          params[:lab_service_id].each do |key, value|
               
               # if status_change
               puts "####################################THE DELETE STATUSES HAVE BEEN CHANGED###################################"
               logger.info "delete statuses are #{group.inspect}"
              
               if value.has_key?('checkbox')
                logger.info "value is: #{value}"
                group = LabDetail.new(
                    pre_appointment_id: @pre_appointment.id,
                    lab_service_id: value['id'].to_i,
                    comment: '',
                    user_id: '',
                    active_status: true,
                    del_status: false
                )
                  if group.save!
                      done = true
                  else
                      done = false
                      break #break if there's a problem
                  end
              end
      
           end
         end
           
      
        format.js { flash.now[:notice] = "Appointment was successfully updated." }
        format.html { redirect_to @pre_appointment, notice: 'Pre appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @pre_appointment }
      else
         @pre_appointments = ProviderMaster.order(:provider_name).where("provider_name like ?", "%#{params[:provider_id]}")
         @suburb_masters = SuburbMaster.order(:suburb_name).where("suburb_name like ?", "%#{params[:suburb_id]}" )
         
          @the_list = @pre_appointments.map { |a|[a.provider_name+" ",a.id]  }
          @loc_list = @suburb_masters.map { |a|[a.suburb_name+" ",a.id]  }
          
          @requester = PersonInfo.where(:person_type_id => 'C')
          @appointment_types = AppointmentType.all
          @request_urgencies = RequestUrgency.all
          
        
        format.js {render :edit}
        format.html { render :edit }
        format.json { render json: @pre_appointment.errors, status: :unprocessable_entity }
      end
    end
  end
  
   
   # Patient appointments
  def my_appointment
    @patient_id = current_user.person_info.id   
    @patient_video_appointments = PreAppointment.where('requester_id =? AND (appointment_type_id =? )', @patient_id, 'VC').paginate(:page => params[:page], :per_page => 5).order('created_at desc')   
    @patient_medical_appointments = PreAppointment.where('requester_id =? AND (appointment_type_id =? )', @patient_id, 'MA').paginate(:page => params[:page], :per_page => 5).order('created_at desc')
    @patient_home_appointments = PreAppointment.where('requester_id =? AND (appointment_type_id =? )', @patient_id, 'HC' ).paginate(:page => params[:page], :per_page => 5).order('created_at desc')  
    @patient_lab_appointments = PreAppointment.where('requester_id =? AND (appointment_type_id =? )', @patient_id, 'LA').paginate(:page => params[:page], :per_page => 5).order('created_at desc')      
    @patient_medication_appointments = PreAppointment.where('requester_id =? AND (appointment_type_id =? )', @patient_id, 'MD').paginate(:page => params[:page], :per_page => 5).order('created_at desc')
  end
  
  def select_appt_option
   
  end
  
  def my_appointment_pds
    @patient_id = current_user.person_info.id 
    @patient_personal_doctor = ConfirmedPersonalDoctorService.where('patient_id =? AND (appointment_type_id =? )', @patient_id, 'PD')[0]
    @unconfimed_pds = PreAppointment.where('requester_id =? AND appointment_type_id =? AND confirm_status =? ', @patient_id, 'PD', false)[0]
    
    @patient_phone_appointments = PreAppointment.where('requester_id =? AND (appointment_type_id =? )', @patient_id, 'PC').paginate(:page => params[:page], :per_page => 5).order('created_at desc')
    @patient_video_appointments = PreAppointment.where('requester_id =? AND (appointment_type_id =? )', @patient_id, 'PDVC').paginate(:page => params[:page], :per_page => 5).order('created_at desc')
    @patient_home_appointments = PreAppointment.where('requester_id =? AND (appointment_type_id =? )', @patient_id, 'PDHC').paginate(:page => params[:page], :per_page => 5).order('created_at desc')
    @patient_prescription_appointments = PreAppointment.where('requester_id =? AND (appointment_type_id =? )', @patient_id, 'PDDP').paginate(:page => params[:page], :per_page => 5).order('created_at desc')
  end
  
    
  def patient_appt_show
    @person_infos = PersonInfo.where(:person_type_id => 'C')[0]
    @appointment_types = AppointmentType.all
    @lab_detail_images = LabDetailImage.all
  end
  
  
  def patient_new_appointment   
      @pre_appointment = PreAppointment.new
      # @url = request.headers["HTTP_REFERER"]
      # @prev = Rails.application.routes.recognize_path(request.referrer)
      @suburb_masters = SuburbMaster.order(:suburb_name).where("suburb_name like ?", "%#{params[:suburb_id]}" )     
      @provider_masters = ProviderMaster.order(:provider_name).where("provider_name like ?", "%#{params[:provider_id]}")
      
      @the_list = @provider_masters.map { |a|[a.provider_name+" ",a.id]  }
      @loc_list = @suburb_masters.map { |a|[a.suburb_name+" ",a.id]  }
      
      @selected = current_user.person_info.surname
      
      logger.info "Selected is #{ @selected.inspect}"
      
      @requester = PersonInfo.where(:person_type_id => 'C')
      @requester_label = lambda { |record| record.surname + " " + record.other_names} 
      
      @find_pds = PreAppointment.where(appointment_type_id: 'PD', requester_id: current_user.person_info.id)[0]
      logger.info "###### #### #{@find_pds.inspect} ###################"
      
      if @find_pds.present?
        logger.info "################################################################################"
        @appointment_types = AppointmentType.where('ref_id =? OR ref_id =? OR ref_id =? OR ref_id =? OR ref_id =?', 'MA', 'LA',  'VC', 'HC', 'MD')       
      else
        logger.info "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
        @appointment_types = AppointmentType.where('ref_id =? OR ref_id =? OR ref_id =? OR ref_id =? OR ref_id =? OR ref_id =?', 'MA', 'LA', 'PD', 'VC', 'HC', 'MD')
      end

        
      # @appointment_types = AppointmentType.where('ref_id =? OR ref_id =? OR ref_id =? OR ref_id =? OR ref_id =? OR ref_id =?', 'MA', 'LA', 'PD', 'VC', 'HC', 'MD')
      
      
      @request_urgencies = RequestUrgency.all
      @lab_services = LabService.all
      @lab_details = LabDetail.all
      @lab_details_list = LabDetail.joins(:lab_service).where("lab_details.pre_appointment_id = #{@pre_appointment_id} and lab_details.del_status = false")
      @lab_detail_images = LabDetailImage.all
      
      @pre_appointment.lab_details.build
      @pre_appointment.lab_detail_images.build
  end
  
  
  def patient_new_appointment_pds
     @pre_appointment = PreAppointment.new
      # @suburb_masters = SuburbMaster.order(:suburb_name).where("suburb_name like ?", "%#{params[:suburb_id]}" )     
      # @provider_masters = ProviderMaster.order(:provider_name).where("provider_name like ?", "%#{params[:provider_id]}")
      
      # @the_list = @provider_masters.map { |a|[a.provider_name+" ",a.id]  }
      # @loc_list = @suburb_masters.map { |a|[a.suburb_name+" ",a.id]  }
#       
      @selected = current_user.person_info.surname
      
      logger.info "Selected is #{ @selected.inspect}"
      
      @requester = PersonInfo.where(:person_type_id => 'C')
      @requester_label = lambda { |record| record.surname + " " + record.other_names} 
      
      @appointment_types = AppointmentType.where('ref_id =? OR ref_id =? OR ref_id =? OR ref_id =? ', 'PC', 'PDVC', 'PDHC', 'PDDP')
      @request_urgencies = RequestUrgency.all
      # @lab_services = LabService.all
      # @lab_details = LabDetail.all
      # @lab_details_list = LabDetail.joins(:lab_service).where("lab_details.pre_appointment_id = #{@pre_appointment_id} and lab_details.del_status = false")
      # @lab_detail_images = LabDetailImage.all
#       
      # @pre_appointment.lab_details.build
      # @pre_appointment.lab_detail_images.build
  end
  
  
  def process_patient_new_appointment
    @pre_appointment = PreAppointment.new(pre_appointment_params)
    
    respond_to do |format|
      if @pre_appointment.save
        
        done = false #if it iterates successfully
        logger.info "allergies #{ params[:lab_service_id].inspect}"
        params[:lab_service_id].each do |key, value|
        if value.has_key?('checkbox')
          logger.info "value is: #{value}"
          group = LabDetail.new(
              pre_appointment_id: @pre_appointment.id,
              lab_service_id: value['id'].to_i,
              comment: '',
              user_id: '',
              active_status: true,
              del_status: false
          )
            if group.save!
                done = true
            else
                done = false
                break #break if there's a problem
            end
        end

      end
              
        format.js { flash.now[:notice] = "Appointment was successful and it is pending for confirmation" }
        format.html { redirect_to @pre_appointment, notice: 'Pre appointment was successfully created.' }
        format.json { render :show, status: :created, location: @pre_appointment }
      else       
          @pre_appointments = ProviderMaster.order(:provider_name).where("provider_name like ?", "%#{params[:provider_id]}")
          @suburb_masters = SuburbMaster.order(:suburb_name).where("suburb_name like ?", "%#{params[:suburb_id]}" )
          @the_list = @pre_appointments.map { |a|[a.provider_name+" ",a.id]  }
          @loc_list = @suburb_masters.map { |a|[a.suburb_name+" ",a.id]  }
          
          @requester = PersonInfo.where(:person_type_id => 'C')
          @appointment_types = AppointmentType.all
          @request_urgencies = RequestUrgency.all
          @lab_services = LabService.all
          @lab_details = LabDetail.all
          
         @pre_appointment.lab_details.build
        format.js { render :patient_new_appointment}
        format.html { render :new }
        format.json { render json: @pre_appointment.errors, status: :unprocessable_entity }
      end
    end    
  end
  
  
  def process_patient_new_appointment_pds
     @pre_appointment = PreAppointment.new(pre_appointment_params)
    
    respond_to do |format|
      if @pre_appointment.save
        
        format.js { flash.now[:notice] = "Appointment was successful and it is pending for confirmation" }
        format.html { redirect_to @pre_appointment, notice: 'Pre appointment was successfully created.' }
        format.json { render :show, status: :created, location: @pre_appointment }
      else       
           @selected = current_user.person_info.surname
      
          logger.info "Selected is #{ @selected.inspect}"
          
          @requester = PersonInfo.where(:person_type_id => 'C')
          @requester_label = lambda { |record| record.surname + " " + record.other_names} 
          
          @appointment_types = AppointmentType.where('ref_id =? OR ref_id =? OR ref_id =? OR ref_id =? ', 'PC', 'PDVC', 'PDHC', 'PDDP')
          @request_urgencies = RequestUrgency.all
        format.js { render :patient_new_appointment_pds}
        format.html { render :new }
        format.json { render json: @pre_appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def patient_lab_details    
    @pre_appointment_id = params[:appointment_id]
    @pre_appointment = PreAppointment.find(@pre_appointment_id)
   
    @lab_details = LabDetail.where(pre_appointment_id: @pre_appointment_id, del_status: false, active_status: true)
    @lab_services = LabService.all
    
    @lab_detail_image = LabDetailImage.where(pre_appointment_id: @pre_appointment_id)[0]
    
    logger.info "lab details is #{@lab_details.inspect}"
    @lab_detail =LabDetail.where(pre_appointment_id: @pre_appointment_id, del_status: false, active_status: true)[0]
    
    
    if @lab_detail.nil?
      flash.now[:notice] = "There are no lab details for this appointment at the moment."
    end
      
  end
  
  # appointments detail
  def patient_video_details    
    @pre_appointment_id = params[:appointment_id]   
    @pre_appointment = PreAppointment.where("id =? AND (appointment_type_id =? )", @pre_appointment_id, 'VC')[0]    
  end
  
  def patient_med_details
     @pre_appointment_id = params[:appointment_id] 
     @pre_appointment = PreAppointment.where("id =? AND (appointment_type_id =? )", @pre_appointment_id, 'MA')[0]    
  end
  
  def patient_medication_details 
     @pre_appointment_id = params[:appointment_id] 
     @pre_appointment = PreAppointment.where("id =? AND (appointment_type_id =? )", @pre_appointment_id, 'MD')[0]    
  end
  
  def patient_home_details 
     @pre_appointment_id = params[:appointment_id] 
     @pre_appointment = PreAppointment.where("id =? AND (appointment_type_id =? )", @pre_appointment_id, 'HC')[0]    
  end
  
  def patient_phone_details 
     @pre_appointment_id = params[:appointment_id] 
     @pre_appointment = PreAppointment.where("id =? AND (appointment_type_id =? )", @pre_appointment_id, 'PC')[0]    
  end
  
  def patient_video_details_pds   
    @pre_appointment_id = params[:appointment_id]   
    @pre_appointment = PreAppointment.where("id =? AND (appointment_type_id =? )", @pre_appointment_id, 'PDVC')[0]    
  end
  
  def patient_home_details_pds   
    @pre_appointment_id = params[:appointment_id]   
    @pre_appointment = PreAppointment.where("id =? AND (appointment_type_id =? )", @pre_appointment_id, 'PDHC')[0]    
  end
  
  def patient_prescription_details   
    @pre_appointment_id = params[:appointment_id]   
    @pre_appointment = PreAppointment.where("id =? AND (appointment_type_id =? )", @pre_appointment_id, 'PDDP')[0]    
  end
   
  
  
  def patient_lab_detail_image
    @pre_appointment_id = params[:pre_appointment_id]
    @lab_detail_image = LabDetailImage.where(pre_appointment_id: @pre_appointment_id)[0]
    @pre_appointment = PreAppointment.where("id =? AND (appointment_type_id =? )", @pre_appointment_id, 'LA')[0]
    # @pre_appointment = PreAppointment.find(@pre_appointment_id)
  end


  def med_record
    @patient_id = params[:patient_id]
    @confirmed_appointment_id = params[:confirmed_appointment_id]
    @pre_appointment_id = params[:pre_appointment_id]
    
    @patient_med_record = PatientMedRecord.where(patient_id: @patient_id, confirmed_appt_id: @confirmed_appointment_id)[0]
    logger.info "Patient medical redcord is #{@patient_med_record.inspect}"
    
  end


  # DELETE /pre_appointments/1
  # DELETE /pre_appointments/1.json
  def destroy
    @pre_appointment.destroy
    respond_to do |format|
      format.html { redirect_to pre_appointments_url, notice: 'Pre appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pre_appointment
      @pre_appointment = PreAppointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pre_appointment_params
      params.require(:pre_appointment).permit(:provider_id, :suburb_id, :requester_id, :requester_cat, :beneficiary_name, :appointment_type_id, :proposed_date, :proposed_time, :complaint_desc, :prev_medical_history, :has_pd, :pd_name, :allergies, :req_urgency, :comment, :user_id, :active_status, :del_status,:src, :confirm_status, :medication, :duration, :beneficiary_phone_number, :pre_confirm_status,   lab_details_attributes: [:id, :pre_appointment_id, :lab_service_id, :comment, :user_id, :active_status, :del_status], lab_detail_images_attributes: [:id, :pre_appointment_id, :image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :comment, :user_id, :del_status, :active_status ]   )
    end
end
