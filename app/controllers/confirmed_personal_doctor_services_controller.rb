class ConfirmedPersonalDoctorServicesController < ApplicationController
  before_action :set_confirmed_personal_doctor_service, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  # GET /confirmed_personal_doctor_services
  # GET /confirmed_personal_doctor_services.json
  def index
    @confirmed_personal_doctor_services = ConfirmedPersonalDoctorService.all.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
     @pre_appointments = PreAppointment.all
     
    
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
        @per_page = params[:per_page] || ConfirmedPersonalDoctorService.per_page || 10
        @confirmed_personal_doctor_services = ConfirmedPersonalDoctorService.paginate( :per_page => @per_page, :page => params[:page])
     else
       perpage = 10
     end
     @per_page = params[:per_page] || ConfirmedPersonalDoctorService.per_page || 10
     page = if params[:page]
              params[:page].to_i
             else
              1 
             end
              
    # Filter 
    if params[:provider_name]
      @provider_name = params[:provider_name]  
      logger.info "The provider is #{@provider_name.inspect}"
      @pre_appointments = PreAppointment.joins(:provider_master).where(provider_masters: {provider_name: @provider_name}).paginate( :page => params[:page], :per_page => 10).order('id desc')   
    
    elsif params[:category]
      @category = params[:category]
      logger.info "The category is #{@category.inspect}"
      @pre_appointments = PreAppointment.joins(:request_category).where(request_categories: {category: @category}).paginate( :page => params[:page], :per_page => 10).order('id desc')
    
    elsif params[:title]
      @type = params[:title]
      logger.info "The type is #{@type.inspect}"
      @pre_appointments = PreAppointment.joins(:appointment_type).where(appointment_types: {title: @type}).paginate( :page => params[:page], :per_page => 10).order('id desc')
    
    end 
  
  
     
    #            
       # per_page = 5
    #    
       # offset = (page - 1) * per_page
       # limit = page * per_page
       # @array = *(offset...limit)
    
    
       if  params[:search_value] && params[:search_value].strip != ''
         
         if params[:search_param] == 'doctor'
           logger.info "the code comes to if  doctor............"
           @confirmed_personal_doctor_services = ConfirmedPersonalDoctorService.doctor_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('id asc')
           
          elsif params[:search_param] == 'patient'
            logger.info "the code comes to elsif patient............."
            @confirmed_personal_doctor_services = ConfirmedPersonalDoctorService.patient_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('id asc')
            
         elsif params[:search_param] == 'location'
            logger.info "the code comes to elsif location............."
            @confirmed_personal_doctor_services = ConfirmedPersonalDoctorService.location_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('id asc')
            
       else
         logger.info "the code comes to the else...."
          @confirmed_personal_doctor_services = ConfirmedPersonalDoctorService.paginate(page: params[:page], per_page: params[:count]).order('id desc')
          @search_json = [] 
         end
        
        elsif params[:search_param] == 'date'
           logger.info "the code comes to elsif date............."
           
           start = (params["start_date"] + " " + "0:00:00")# Time.zone.parse(params["start_date"].to_s + " " + "0:00:00").utc # params["start_date"].to_s + "0:00:00"
           ended = params["end_date"] + " " + ("23:59:59") # Time.zone.parse(params["end_date"].to_s + " " + "23:59:59").utc # params["end_date"].to_s + "23:59:59"
           @confirmed_personal_doctor_services = ConfirmedPersonalDoctorService.search_date(start,ended).paginate(page: params[:page], per_page: params[:count]).order('id asc')
     
         
       end
       p "JSON ARRAY: #{@search_json}"
        
      
      respond_to do |format|
        logger.info "what is the url calling this??: ans #{request.referer}"
        format.js
        format.html
        format.csv { send_data @confirmed_personal_doctor_services.to_csv(options = {}, page, perpage)}
        format.xls { send_data @confirmed_personal_doctor_services.to_csv(options={col_sep: "\t"}, page, perpage)}
      end
         
  end
  
  
  def all_confirmed_pds_excel
    @confirmed_personal_doctor_services = ConfirmedPersonalDoctorService.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @confirmed_personal_doctor_services.to_csv }
      format.xls { send_data @confirmed_personal_doctor_services.to_csv(options={col_sep: "\t"}) }
    end
  end
  

  # GET /confirmed_personal_doctor_services/1
  # GET /confirmed_personal_doctor_services/1.json
  def show
  end

  # GET /confirmed_personal_doctor_services/new
  def new
    @confirmed_personal_doctor_service = ConfirmedPersonalDoctorService.new
    
    @pre_appointment_id = params[:pre_appointment_id]
    @requester_id = params[:requester_id]
    @suburb_id = params[:suburb_id]
    logger.info "#############################HERE IS THE PRE APPOINTMENT ID###############"
    logger.info "Pre appointment id: #{@pre_appointment_id.inspect}"
    logger.info "Suburb id: #{@suburb_id.inspect}"
    @selected_pre_appointment = PreAppointment.find(@pre_appointment_id)
     @appointment_type_id  = @selected_pre_appointment.appointment_type_id
    
    @suburb_masters = SuburbMaster.joins(:pre_appointments).where("suburb_masters.suburb_name like ?", "%#{params[:suburb_id]}" ) 
     logger.info "person is: #{@suburb_masters.inspect}"      
     # @person_infos = PersonInfo.where("surname like ? and pd_sub = ? ", "%#{params[:doctor_id]}%", true )
    
    @person_infos = PersonInfo.joins(:person_contact_infos, :users).where("person_infos.surname ilike ? and person_infos.pd_sub =?  and person_infos.person_type_id =? and users.active_status =? and person_infos.active_status =?", "%#{params[:doctor_id]}", true, "D", true, true)
    logger.info "person is: #{@person_infos.inspect}"
    @the_list = @person_infos.map { |a|[a.surname+" "+a.other_names+" ",a.id]  } 
    
    @loc_list = @suburb_masters.map { |a|[a.suburb_name+" ",a.id]  }
    
     @condition_masters = ConditionMaster.all
     @confirmed_conditions = ConfirmedCondition.all
     
     #Disable conditions for now
     # @confirmed_appointment.confirmed_conditions.build
     
     
     @provider = @selected_pre_appointment.provider_master.provider_name if @selected_pre_appointment.provider_master
     @proposed_date = @selected_pre_appointment.proposed_date.strftime("%F %R") if @selected_pre_appointment.proposed_date
     @proposed_loc = @selected_pre_appointment.suburb_master.suburb_name if @selected_pre_appointment.suburb_master
     
     logger.info "Selected Pre appointment is: #{@selected_pre_appointment.inspect}"
     logger.info "Service provider is: #{@provider.inspect}"
     logger.info "Relations is: #{@selected_pre_appointment.suburb_master.inspect}"
     @suburb = @selected_pre_appointment.suburb_master.suburb_name if @selected_pre_appointment.suburb_master
     logger.info "Suburbis: #{@suburb.inspect}"
     
     # session[:pre_appointment_id] = @pre_appointment_id
     # session[:suburb_id] = @suburb_id
     # session[:requester_id] = @requester_id
     
  end

  # GET /confirmed_personal_doctor_services/1/edit
  def edit
    @pre_appointment_id = params[:pre_appointment_id]
    @requester_id = params[:requester_id]
    @suburb_id = params[:suburb_id]
    logger.info "#############################HERE IS THE PRE APPOINTMENT ID###############"
    logger.info "Pre appointment id: #{@pre_appointment_id.inspect}"
    @selected_pre_appointment = PreAppointment.find(@pre_appointment_id)
    @suburb_masters = SuburbMaster.order(:suburb_name).where("suburb_name like ?", "%#{params[:suburb_id]}" ) 
           
     # @person_infos = PersonInfo.where("surname like ? and pd_sub = ? ", "%#{params[:doctor_id]}%", true )
    
    @person_infos = PersonInfo.joins(:person_contact_infos).where("person_infos.surname like ? and person_infos.pd_sub =?  and person_infos.person_type_id =? ", "%#{params[:doctor_id]}", true, "D")
    # and  person_contact_infos.suburb_id =?
    logger.info "person is: #{@person_infos.inspect}"
    @the_list = @person_infos.map { |a|[a.surname+" "+a.other_names+" ",a.id]  } 
    
     @loc_list = @suburb_masters.map { |a|[a.suburb_name+" ",a.id]  }
    
     @condition_masters = ConditionMaster.all
     @confirmed_conditions = ConfirmedCondition.all
     
     #Disable conditions for now
     # @confirmed_appointment.confirmed_conditions.build
     
     
     @provider = @selected_pre_appointment.provider_master.provider_name if @selected_pre_appointment.provider_master
     @proposed_date = @selected_pre_appointment.proposed_date.strftime("%F %R") if @selected_pre_appointment.proposed_date
     @proposed_loc = @selected_pre_appointment.suburb_master.suburb_name if @selected_pre_appointment.suburb_master
     
     logger.info "Selected Pre appointment is: #{@selected_pre_appointment.inspect}"
     logger.info "Service provider is: #{@provider.inspect}"
     logger.info "Relations is: #{@selected_pre_appointment.suburb_master.inspect}"
     suburb = @selected_pre_appointment.suburb_master.suburb_name if @selected_pre_appointment.suburb_master
     logger.info "Suburbis: #{suburb.inspect}"
     
     # session[:pre_appointment_id] = @pre_appointment_id
     session[:suburb_id] = @suburb_id
     # session[:requester_id] = @requester_id    
  end
  
  
  def edit_pds_from_confirmed_appointment
    # @id = params[:ids]
    @confirmed_appointment_id = params[:confirmed_appointment_id]
    logger.info "PDS id is : #{@id.inspect}"
    logger.info "Confirmed Appointments id is : #{@confirmed_appointment_id.inspect}"

    @confirmed_personal_doctor_service = ConfirmedPersonalDoctorService.where(:confirmed_appointment_id => @confirmed_appointment_id)[0]
    logger.info "Confirmed PDS is : #{@confirmed_personal_doctor_service.inspect}"
    
    @suburb_id = @confirmed_personal_doctor_service.suburb_id
    @suburb_masters = SuburbMaster.order(:suburb_name).where("suburb_name like ?", "%#{@suburb_id}" ) 
    
  end
  
  
  def enable_confirmed_pds
      pds_id=params[:chosen]
      pds = ConfirmedPersonalDoctorService.where(id: pds_id )[0]
     if pds.update(:active_status => 1)
       redirect_to confirmed_personal_doctor_services_path, notice: 'Personal Doctor Service was successfully enabled.'
     end
   end
 
  def disable_confirmed_pds
      pds_id=params[:chosen]     
      pds = ConfirmedPersonalDoctorService.where(id: pds_id )[0]      
     if pds.update!(:active_status => 0)
       redirect_to confirmed_personal_doctor_services_path, notice: 'Personal Doctor Service was successfully disabled.'
     end    
  end
  
  # delete personal patient by doctor
  def disable_personal_patient  
     confirmed_appt_id=params[:chosen]
     # doctor_id=params[:doc]    
     confirmed_appt = ConfirmedAppointment.where(id: confirmed_appt_id)[0]
     logger.info "Here is the confirmed appt #{confirmed_appt.inspect}"    
      pds = ConfirmedPersonalDoctorService.where(confirmed_appointment_id: confirmed_appt_id )[0]
      logger.info "Here is the pds for the doctore #{pds.inspect}" 
      
      if confirmed_appt.update!(:del_status => 1, :active_status => 0) and pds.update!(:del_status => 1, :active_status => 0)
         redirect_to doctor_pds_path, notice: 'Patient deleted successfully .'
      end
       
     # if pds.update!(:del_status => 1, :active_status => 0)
#        
#        
        
     # end 
     
      # respond_to do |format|  
           # format.js 
           # format.html { "<script type='text/javascript'> window.location.href='/comfirmed_appointments/doctor_pds'</script>" }
           # # format.json { render :show, status: :created, location: @doctor_personal_patients }
        # end
#     
  end
  
  

  # POST /confirmed_personal_doctor_services
  # POST /confirmed_personal_doctor_services.json
  def create
    # @confirmed_personal_doctor_service = ConfirmedPersonalDoctorService.new(confirmed_personal_doctor_service_params)
    
    @pre_appointment_id = confirmed_personal_doctor_service_params[:pre_appointment_id]
    @requester_id = confirmed_personal_doctor_service_params[:patient_id]
    @suburb_id = confirmed_personal_doctor_service_params[:suburb_id]
    # session.delete(:suburb_id)
    
     # session[:pre_appointment_id] = @pre_appointment_id
     # session[:suburb_id] = @suburb_id
     # session[:requester_id] = @requester_id
     
    logger.info "Maintain suburb id after confirm: #{@suburb_id.inspect}"
    logger.info "Maintain requester id after confirm: #{@requester_id.inspect}"
    logger.info "Maintain pre appointment id after confirm: #{@pre_appointment_id.inspect}"
    
    @pre_appointments = PreAppointment.find(@pre_appointment_id)
    
      # @appointment_type_id = @pre_appointments.appointment_type_id
    respond_to do |format|
      @confirmed =  ConfirmedAppointment.new(
            pre_appointment_id: @pre_appointment_id, 
            # confirmed_date: DateTime.now,
            suburb_id: @suburb_id,
            doctor_id: confirmed_personal_doctor_service_params[:doctor_id],
            patient_id: confirmed_personal_doctor_service_params[:patient_id],
            active_status: true,
            del_status: false
        )
        
      if  @confirmed.save!
             @confirmed_personal_doctor_service =  ConfirmedPersonalDoctorService.new(
                   :doctor_id => confirmed_personal_doctor_service_params[:doctor_id],
                   :patient_id => confirmed_personal_doctor_service_params[:patient_id],
                   :comment =>confirmed_personal_doctor_service_params[:comment],
                   :entity_id => confirmed_personal_doctor_service_params[:entity_id],
                   :user_id => confirmed_personal_doctor_service_params[:user_id],
                   :active_status => confirmed_personal_doctor_service_params[:active_status],
                   :del_status => confirmed_personal_doctor_service_params[:del_status],
                   :pre_appointment_id => confirmed_personal_doctor_service_params[:pre_appointment_id],
                   :suburb_id =>confirmed_personal_doctor_service_params[:suburb_id],
                   :appointment_type_id =>confirmed_personal_doctor_service_params[:appointment_type_id],
                   :confirmed_appointment_id => @confirmed.id
               )
               
               
               if @confirmed_personal_doctor_service.save!
                  # insert prev_medical_histroy
                  @confirmed_pds_id = @confirmed_personal_doctor_service.id
                  
                @patient_history =  PdsPatientPrevMedHistory.new(
                     confirmed_pds_id: @confirmed_pds_id,
                     prev_med_histry:  @pre_appointments.prev_medical_history,
                     user_id: current_user.id,
                     active_status: true,
                     del_status: false
                   )
                 
                 
                 if @patient_history.save!
                    @confirmed_id = @confirmed.id 
                     logger.info "Confirmed Appointment id is #{@confirmed_id}"
                     @pre_appointments.update_attribute(:confirm_status, true)
                     # @pre_appointments.update!(
                      # confirm_status: true,
                      # requester_cat: 'S',
                      # req_urgency: 'S',
                      # proposed_date: DateTime.now
                      # # beneficiary_name: ''
                  # )
                 end
                 
                 
                            
               end
                 
        # @confirmed_personal_doctor_service.save

        format.js { flash.now[:notice] = "Appointment was successfully confirmed."}
        format.html { redirect_to @confirmed_personal_doctor_service, notice: 'Confirmed personal doctor service was successfully created.' }
        format.json { render :show, status: :created, location: @confirmed_personal_doctor_service }
      else
       @selected_pre_appointment = PreAppointment.find(@pre_appointment_id)
       @appointment_type_id  = @selected_pre_appointment.appointment_type_id
    # @suburb_masters = SuburbMaster.order(:suburb_name).where("suburb_name like ?", "%#{params[:suburb_id]}" ) 
           
     # @person_infos = PersonInfo.where("surname like ? and pd_sub = ? ", "%#{params[:doctor_id]}%", true )
    
      @person_infos = PersonInfo.joins(:person_contact_infos).where("person_infos.surname like ? and person_infos.pd_sub = ?  and person_infos.person_type_id = ? ", "%#{params[:doctor_id]}", true, "D" )
      # @person_infos = session.delete(:person_info)
      logger.info "person is: #{@person_infos.inspect}"
      @the_list = @person_infos.map { |a|[a.surname+" "+a.other_names+" ",a.id]  } 
    
    # @loc_list = @suburb_masters.map { |a|[a.suburb_name+" ",a.id]  }
    
     @condition_masters = ConditionMaster.all
     @confirmed_conditions = ConfirmedCondition.all
     
     #Disable conditions for now
     # @confirmed_appointment.confirmed_conditions.build
     
     
     @provider = @selected_pre_appointment.provider_master.provider_name if @selected_pre_appointment.provider_master
     @proposed_date = @selected_pre_appointment.proposed_date.strftime("%F %R") if @selected_pre_appointment.proposed_date
     @proposed_loc = @selected_pre_appointment.suburb_master.suburb_name if @selected_pre_appointment.suburb_master
     
     logger.info "Selected Pre appointment is: #{@selected_pre_appointment.inspect}"
     logger.info "Service provider is: #{@provider.inspect}"
     logger.info "Relations is: #{@selected_pre_appointment.suburb_master.inspect}"
     suburb = @selected_pre_appointment.suburb_master.suburb_name if @selected_pre_appointment.suburb_master
     logger.info "Suburbis: #{suburb.inspect}"

      
      
        format.js { render :new }  
        format.html { render :new }
        format.json { render json: @confirmed_personal_doctor_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /confirmed_personal_doctor_services/1
  # PATCH/PUT /confirmed_personal_doctor_services/1.json
  def update
    respond_to do |format|
      if @confirmed_personal_doctor_service.update(confirmed_personal_doctor_service_params)
        format.js {flash.now[:notice] = "PDS updated successfully"}
        format.html { redirect_to @confirmed_personal_doctor_service, notice: 'Confirmed personal doctor service was successfully updated.' }
        format.json { render :show, status: :ok, location: @confirmed_personal_doctor_service }
      else
        format.js {render :edit }
        format.html { render :edit }
        format.json { render json: @confirmed_personal_doctor_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /confirmed_personal_doctor_services/1
  # DELETE /confirmed_personal_doctor_services/1.json
  def destroy
    @confirmed_personal_doctor_service.destroy
    respond_to do |format|
      format.html { redirect_to confirmed_personal_doctor_services_url, notice: 'Confirmed personal doctor service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_confirmed_personal_doctor_service
      @confirmed_personal_doctor_service = ConfirmedPersonalDoctorService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def confirmed_personal_doctor_service_params
      params.require(:confirmed_personal_doctor_service).permit(:doctor_id, :patient_id, :comment, :entity_id, :user_id, :active_status, :del_status, :pre_appointment_id, :suburb_id, :appointment_type_id, :confirmed_appointment_id )
    end
end
