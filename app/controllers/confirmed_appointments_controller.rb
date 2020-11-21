class ConfirmedAppointmentsController < ApplicationController
  before_action :set_confirmed_appointment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  include GhingerApi
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


  # GET /confirmed_appointments
  # GET /confirmed_appointments.json
  def index
    @confirmed_appointments = ConfirmedAppointment.all.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
    @pre_appointments = PreAppointment.all.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
    @provider_masters = ProviderMaster.all.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
    
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
      @per_page = params[:per_page] || ConfirmedAppointment.per_page || 10
      @confirmed_appointments = ConfirmedAppointment.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || ConfirmedAppointment.per_page || 10
   page = if params[:page]
            params[:page].to_i
           else
            1
           end
   

      
# Filter 
if params[:provider_name]
  @provider_name = params[:provider_name]  
  logger.info "The provider is #{@provider_name.inspect}"
  @confirmed_appointments = ConfirmedAppointment.joins(:provider_master).where(provider_masters: {provider_name: @provider_name}).paginate( :page => params[:page], :per_page => 10).order('id desc')   

elsif params[:category]
  @category = params[:category]
  logger.info "The category is #{@category.inspect}"
  @confirmed_appointments = ConfirmedAppointment.joins(:pre_appointment, :request_category).where(request_categories: {category: @category }).paginate( :page => params[:page], :per_page => 10).order('id desc')

elsif params[:title]
  @type = params[:title]
  logger.info "The type is #{@type.inspect}"
  @confirmed_appointments = ConfirmedAppointment.joins(:pre_appointment, :appointment_type).where(appointment_types: {title: @type}).paginate( :page => params[:page], :per_page => 10).order('id desc')

elsif params[:user_type_title]
  @person_type = params[:user_type_title]
  logger.info "Then person is #{@person_type.inspect}"
  @person_type_info = PersonTypeMaster.where(user_type_title: @person_type)
  @person_type_ref = @person_type_info.last.ref_id
  @confirmed_appointments = ConfirmedAppointment.all.paginate( :page => params[:page], :per_page => 10).order('created_at desc')

end

if params[:patient]
  @confirmed_appointments = ConfirmedAppointment.patient_search(params[:patient]).paginate( :page => params[:page], :per_page => 10).order('created_at desc')
elsif params[:doctor]
  @confirmed_appointments = ConfirmedAppointment.doctor_search(params[:doctor]).paginate( :page => params[:page], :per_page => 10).order('created_at desc')
elsif params[:nurse]
  @confirmed_appointments = ConfirmedAppointment.nurse_search(params[:nurse]).paginate( :page => params[:page], :per_page => 10).order('created_at desc')
elsif params[:pharmacist]
  @person_infos = PersonInfo.pharmacist_search(params[:pharmacist]).paginate( :page => params[:page], :per_page => 10).order('created_at desc')
elsif params[:laboratorist]
  @person_infos = PersonInfo.laboratorist_search(params[:laboratorist]).paginate( :page => params[:page], :per_page => 10).order('created_at desc')
end



   
#             
   # per_page = 5
#    
   # offset = (page - 1) * per_page
   # limit = page * per_page
   # @array = *(offset...limit)


   # if  params[:search_value] && params[:search_value].strip != ''
#      
     # if params[:search_param] == 'firstname'
       # logger.info "the code comes to if  firstname............"
       # @contacts = Contact.firstname_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('ID asc')
#        
      # elsif params[:search_param] == 'lastname'
        # logger.info "the code comes to elsif lastname............."
        # @contacts = Contact.lastname_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('ID asc')
#         
   # else
     # logger.info "the code comes to the else...."
      # @contacts = Contact.paginate(page: params[:page], per_page: params[:count]).order('ID desc')
      # @search_json = []
     # end
#     
    # elsif params[:search_param] == 'date'
       # logger.info "the code comes to elsif date............."
#        
       # start = (params["start_date"] + " " + "0:00:00")# Time.zone.parse(params["start_date"].to_s + " " + "0:00:00").utc # params["start_date"].to_s + "0:00:00"
       # ended = params["end_date"] + " " + ("23:59:59") # Time.zone.parse(params["end_date"].to_s + " " + "23:59:59").utc # params["end_date"].to_s + "23:59:59"
       # @contacts = Contact.search_date(start,ended).paginate(page: params[:page], per_page: params[:count]).order('ID asc')
#  
#      
   # end
   # p "JSON ARRAY: #{@search_json}"
#     
    
    respond_to do |format|
      logger.info "what is the url calling this??: ans #{request.referer}"
      format.js
      format.html
      format.csv { send_data @confirmed_appointments.to_csv(options = {}, page, perpage)}
      format.xls { send_data @confirmed_appointments.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
      
  end
  
  def all_confirmed_appointment_excel
    @confirmed_appointments = ConfirmedAppointment.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @confirmed_appointments.to_csv }
      format.xls { send_data @confirmed_appointments.to_csv(options={col_sep: "\t"}) }
    end
  end

  # GET /confirmed_appointments/1
  # GET /confirmed_appointments/1.json
  def show
    # @provider_masters = ProvierMaster.all
  end

  # GET /confirmed_appointments/new
  def new
    @confirmed_appointment = ConfirmedAppointment.new
    
    @pre_appointment_id = params[:pre_appointment_id]
    logger.info "#############################HERE IS THE PRE APPOINTMENT ID###############"
    logger.info "Pre appointment id: #{@pre_appointment_id.inspect}"
    @provider_masters = ProviderMaster.order(:provider_name).where("provider_name like ?", "%#{params[:provider_id]}")
    @suburb_masters = SuburbMaster.order(:suburb_name).where("suburb_name like ?", "%#{params[:suburb_id]}" )    
    @doctors = PersonInfo.order(:surname).where("surname like ? and person_type_id = ?" , "%#{params[:doctor_id]}", "D" )
    @nurses = PersonInfo.order(:surname).where("surname like ? and person_type_id = ?" , "%#{params[:nurse_id]}", "N" )
    
    @the_list = @provider_masters.map { |a|[a.provider_name+" ",a.id]  }
    @loc_list = @suburb_masters.map { |a|[a.suburb_name+" ",a.id]  }
    @doc_list = @doctors.map { |a|[a.surname+" "+a.other_names+" ",a.id]  }
    @nurse_list = @nurses.map { |a|[a.surname+" "+a.other_names+" ",a.id]  }
    
     @condition_masters = ConditionMaster.all
     @confirmed_conditions = ConfirmedCondition.all
     
     
     
     @selected_pre_appointment = PreAppointment.find(@pre_appointment_id)
     @provider = @selected_pre_appointment.provider_master.provider_name if @selected_pre_appointment.provider_master
     @proposed_date = @selected_pre_appointment.proposed_date.strftime("%F %R") if @selected_pre_appointment.proposed_date
     @proposed_loc = @selected_pre_appointment.suburb_master.suburb_name if @selected_pre_appointment.suburb_master
     
     logger.info "Selected Pre appointment is: #{@selected_pre_appointment.inspect}"
     logger.info "Service provider is: #{@provider.inspect}"
     logger.info "Relations is: #{@selected_pre_appointment.suburb_master.inspect}"
     suburb = @selected_pre_appointment.suburb_master.suburb_name if @selected_pre_appointment.suburb_master
     logger.info "Suburbis: #{suburb.inspect}"


    # //for lab appointments
    @lab_services = ServiceFeeMaster.where(appt_type_id: "LA", active_status: true, del_status: false, req_urgency: @selected_pre_appointment.req_urgency)
    @lab_details = LabDetail.all
    @lab_details_list = LabDetail.joins(:lab_service).where("lab_details.pre_appointment_id = #{@pre_appointment_id} and lab_details.del_status = false")

    # for medication and presciption
    @med_services = DrugPrice.joins(:drug_master).where("drug_prices.active_status =? and drug_prices.del_status =? and drug_masters.active_status =? and drug_masters.del_status =?", true, false, true, false)
    @med_details = MedicationDetail.all


  end

  # GET /confirmed_appointments/1/edit
  def edit
    @provider_masters = ProviderMaster.order(:provider_name).where("provider_name like ?", "%#{params[:provider_id]}")
    @suburb_masters = SuburbMaster.order(:suburb_name).where("suburb_name like ?", "%#{params[:suburb_id]}" )    
    
    @pre_appointment_id = @confirmed_appointment.pre_appointment_id
    @selected_pre_appointment = PreAppointment.find(@pre_appointment_id)
    @doctors = PersonInfo.order(:surname).where("surname like ? and person_type_id = ?" , "%#{params[:doctor_id]}", "D" )
    logger.info "Selected pre appointment id #{@selected_pre_appointment.inspect}"
    
    @the_list = @provider_masters.map { |a|[a.provider_name+" ",a.id]  }
    @loc_list = @suburb_masters.map { |a|[a.suburb_name+" ",a.id]  }
    @doc_list = @doctors.map { |a|[a.surname+" "+a.other_names+" ",a.id]  }


    # @condition_masters = ConditionMaster.all
    # @confirmed_conditions = ConfirmedCondition.all

    # //for lab appointments
    @lab_services = ServiceFeeMaster.where(appt_type_id: "LA", active_status: true, del_status: false)
    @lab_details = LabDetail.all
    @lab_details_list = LabDetail.joins(:lab_service).where("lab_details.pre_appointment_id = #{@pre_appointment_id} and lab_details.del_status = false")

  end

  
  def enable_appointment
      appointment_id=params[:chosen]
      app = ConfirmedAppointment.find(appointment_id)
     if app.update(:active_status => 1)
       redirect_to confirmed_appointments_path, notice: 'Appointment was successfully enabled.'
     end
   end
 
  def disable_appointment
      appointment_id=params[:chosen]     
      app = ConfirmedAppointment.find(appointment_id)      
     if app.update!(:active_status => 0)
       redirect_to confirmed_appointments_path, notice: 'Appointment was successfully disabled.'
     end    
  end
  
   
  # Fetch doctor appointments 
  def doctor_general_appointments
      if current_user.role.name == 'Doctor'
        @doctor_id = current_user.person_info.id
        logger.info "Doctor id is #{@doctor_id.inspect}"
        @doctor_video_appointments = ConfirmedAppointment.joins(:pre_appointment).where('confirmed_appointments.doctor_id =? AND (pre_appointments.appointment_type_id =? ) ', @doctor_id, 'VC' ).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
        # @doctor_phone_appointments = ConfirmedAppointment.joins(:pre_appointment).where('confirmed_appointments.doctor_id =? AND (pre_appointments.appointment_type_id =? ) ', @doctor_id, 'PC' ) 
        @doctor_home_appointments = ConfirmedAppointment.joins(:pre_appointment).where('confirmed_appointments.doctor_id =? AND (pre_appointments.appointment_type_id =? ) ', @doctor_id, 'HC' ).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
        # @doctor_prescription_appointments = ConfirmedAppointment.joins(:pre_appointment).where('confirmed_appointments.doctor_id =? AND (pre_appointments.appointment_type_id =? ) ', @doctor_id, 'DP' )
        @doctor_medication_appointments = ConfirmedAppointment.joins(:pre_appointment).where('confirmed_appointments.doctor_id =? AND (pre_appointments.appointment_type_id =? ) ', @doctor_id, 'MD' ).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
        logger.info "video is #{ @doctor_video_appointments.inspect}"
        
        logger.info "home care is #{@doctor_home_appointments.inspect}"
        # if @doctor_video_appointments.blank?
          # flash.now[:notice] = "Sorry you do not have any appointment"
        # end
        
        
        
          
        respond_to do |format|  
           format.js 
           format.html { "<script type='text/javascript'> window.location.href='/comfirmed_appointments/index'</script>" }
           format.json { render :show, status: :created, location: @confirmed_appointment }
        end
        
      end     
  end
  
  def doctor_pds_appointments
    if current_user.role.name == 'Doctor'
        @doctor_id = current_user.person_info.id
        logger.info "Doctor id is #{@doctor_id.inspect}"
        @doctor_video_appointments = ConfirmedAppointment.joins(:pre_appointment).where('confirmed_appointments.doctor_id =? AND (pre_appointments.appointment_type_id =?) ', @doctor_id, 'PDVC' ).order('created_at desc')
        @doctor_phone_appointments = ConfirmedAppointment.joins(:pre_appointment).where('confirmed_appointments.doctor_id =? AND (pre_appointments.appointment_type_id =? ) ', @doctor_id, 'PC' ).order('created_at desc')
        @doctor_home_appointments = ConfirmedAppointment.joins(:pre_appointment).where('confirmed_appointments.doctor_id =? AND (pre_appointments.appointment_type_id =?) ', @doctor_id, 'PDHC' ).order('created_at desc')
        @doctor_prescription_appointments = ConfirmedAppointment.joins(:pre_appointment).where('confirmed_appointments.doctor_id =? AND (pre_appointments.appointment_type_id =? ) ', @doctor_id, 'DP' ).order('created_at desc')
        # @doctor_medication_appointments = ConfirmedAppointment.joins(:pre_appointment).where('confirmed_appointments.doctor_id =? AND (pre_appointments.appointment_type_id =? ) ', @doctor_id, 'MD' )        
        logger.info "video is #{ @doctor_video_appointments.inspect}"
        
        logger.info "home care is #{@doctor_home_appointments.inspect}"
        # if @doctor_video_appointments.blank?
          # flash.now[:notice] = "Sorry you do not have any appointment"
        # end
          
        respond_to do |format|  
           format.js 
           format.html { "<script type='text/javascript'> window.location.href='/comfirmed_appointments/index'</script>" }
           format.json { render :show, status: :created, location: @confirmed_appointment }
        end
        
      end     
    
  end
  
  
  
  # Fetch nurse appointments
  def nurse_appointments
    if current_user.role.name == 'Nurse'
        @nurse_id = current_user.person_info.id
        logger.info "Nurse id is #{@nurse_id.inspect}"
        @nurse_appointments = ConfirmedAppointment.joins(:pre_appointment).where('confirmed_appointments.nurse_id =? AND pre_appointments.appointment_type_id =? ', @nurse_id, 'HC').order("created_at desc")
    end
  end
  
  
 # fetch doctor pesonal patients 
  def doctor_pds
    
    if current_user.role.name == 'Doctor'
        @doctor_id = current_user.person_info.id
        logger.info "Doctor id is #{@doctor_id.inspect}"
        @doctor_personal_patients = ConfirmedAppointment.joins(:pre_appointment).where('confirmed_appointments.doctor_id =? AND confirmed_appointments.active_status =? AND (pre_appointments.appointment_type_id =? ) ', @doctor_id, true, 'PD' ).order("created_at desc")
        
        logger.info "this is the personal patients of the doctor #{@doctor_personal_patients.inspect}"
        
        # if @doctor_video_appointments.blank?
          # flash.now[:notice] = "Sorry you do not have any appointment"
        # end
          
        respond_to do |format|  
           format.js 
           format.html { "<script type='text/javascript'> window.location.href='/comfirmed_appointments/index'</script>" }
           format.json { render :show, status: :created, location: @doctor_personal_patients }
        end
        
      end
    
  end
  
  
  def find_patient_details
     @patient_id = params[:chosen]
     @doctor_id = params[:doc]
     
     @patient_detail = PersonInfo.joins(:person_contact_infos).where("person_infos.id =?", @patient_id)[0]
     logger.info "Patient details #{@patient_detail.inspect}"
     
     @patient_allergies = RequesterAllergy.where(requester_id: @patient_id, active_status: true)  
     logger.info "Requester allergies #{@patient_allergies.inspect}"
     
     @patient_pmh = PdsPatientPrevMedHistory.joins(:confirmed_personal_doctor_service).where("confirmed_personal_doctor_services.patient_id =? ", @patient_id)[0]
     
     logger.info "Patient Previous medical histroy is #{@patient_pmh.inspect}"
     
     # @previous_encounters = ConfirmedAppointment.where(patient_id: @patient_id, doctor_id: @doctor_id, attended_to: true).paginate(:page => params[:page], :per_page => 3).order('created_at desc')
     
     @previous_encounters = ConfirmedAppointment.joins(:patient_med_records).where("confirmed_appointments.patient_id =? and confirmed_appointments.doctor_id =? and confirmed_appointments.attended_to =?", @patient_id, @doctor_id, true).paginate(:page => params[:page], :per_page => 3).order('created_at desc')      
     logger.info "Tracking####### #{@previous_encounters.inspect}"
    
     # get suburb through person contact info
     
     # @suburb = PersonContactInfo.joins(:suburb_master).where('person_contact_infos.person_id =?', patient_id)[0]
     # logger.info "Contact details #{@suburb.inspect}"
    
     # respond_to do |format|  
           # format.js 
           # format.html { "<script type='text/javascript'> window.location.href='/comfirmed_appointments/index'</script>" }
           # format.json { render :show, status: :created, location: @doctor_personal_patients }
        # end
       # redirect_to doctor_pds_path, notice: 'Patient deleted successfully .'
  end
  
  
  
  
  def update_attend_status
     if params[:attend_to]
       @attend_to = params[:attend_to]
       @doctor_id = session.delete(:doctor_id)
       logger.info "Attend to is #{@attend_to.inspect}"
        logger.info "Doctor id #{@doctor_id.inspect}"
        
        @appt_id = params[:appt_id]
        logger.info "appointment id #{@appt_id.inspect}"
        appointment = ConfirmedAppointment.find(@appt_id)
        logger.info "appointment #{appointment.inspect}"
       
       
       if @attend_to == "Not attended to"
         logger.info "############################"
         logger.info "############################"
         logger.info "############################"
         @attend_to_value = 0
         logger.info "The value of the attend to"
         logger.info  @attend_to_value
        
         
       elsif
         @attend_to == "Attended to"
         logger.info "############################"
         logger.info "############################"
         logger.info "############################"
         @attend_to_value = 1
         logger.info "The value of the attend to"
         logger.info  @attend_to_value
         
       end 
       
       appointment.update(
          attended_to: @attend_to_value
       )
       
       if appointment.save
         flash.now[:notice] = "Status updated successfully"
       end
               
     end
  end



  # POST /confirmed_appointments
  # POST /confirmed_appointments.json
  def create
    ghinger_conn = Connect.new
    @confirmed_appointment = ConfirmedAppointment.new(confirmed_appointment_params)
    
    @pre_appointment_id = confirmed_appointment_params[:pre_appointment_id]
    @pre_appointment = PreAppointment.find(@pre_appointment_id)
    logger.info "##SELECT PRE APPOINTMENT ID### #{@pre_appointment_id.inspect}"
    logger.info "##SELECT PRE APPOINTMENT DETAILS### #{@pre_appointment.inspect}"
    
    @appointment_type_id = @pre_appointment.appointment_type_id
    logger.info "##Appontment type id ### #{@pre_appointment.appointment_type_id.inspect}"
    
    respond_to do |format| 
          
        if @confirmed_appointment.save

          # get appointment id and type
          @appt_type = @confirmed_appointment.pre_appointment.appointment_type_id
          @confirmed_appt_id = @confirmed_appointment.id


            @pre_appointment.skip_callbacks = true
            @pre_appointment.update_attribute(
              'confirm_status', true
            )

            if @confirmed_appointment.pre_appointment.appointment_type_id == "LA"
              done = false #if it iterates successfully
              logger.info "allergies #{ params[:lab_service_id].inspect}"
              params[:lab_service_id].each do |key, value|
                if value.has_key?('checkbox')
                  logger.info "value is: #{value}"
                  group = LabDetail.new(
                      confirmed_appt_id: @confirmed_appointment.id,
                      lab_service_id: value['service_id'].to_i,
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
            elsif @confirmed_appointment.pre_appointment.appointment_type_id == "MD"
              params[:drug_id].each do |key, value|
                if value.has_key?('checkbox')
                  logger.info "value is: #{value}"
                  group = MedicationDetail.new(
                      confirmed_appt_id: @confirmed_appointment.id,
                      drug_id: value['drug_id'].to_i,
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

        
          if @appointment_type_id  == 'PC' or @appointment_type_id == 'PDVC' or @appointment_type_id == 'PDHC' or @appointment_type_id == 'DP'
                 
             #Find out if the patient has a personal doctor
             @patient_id = @pre_appointment.requester_id
             
             @personal_doctor = ConfirmedPersonalDoctorService.where(patient_id: @patient_id, appointment_type_id: 'PD', active_status: true)[0]
             
             logger.info "personal doctor is #{@personal_doctor.inspect}"
             
             @confirmed_appointment.update(
                doctor_id: @personal_doctor.doctor_id,
                patient_id: @personal_doctor.patient_id
             )
          
          if @confirmed_appointment.save!
      
             @confirmed_pds =  ConfirmedPersonalDoctorService.new(
                  doctor_id: @personal_doctor.doctor_id,
                  patient_id: @personal_doctor.patient_id,
                  user_id: current_user.id,
                  pre_appointment_id: @pre_appointment_id,
                  appointment_type_id: @pre_appointment.appointment_type_id,
                  confirmed_appointment_id: @confirmed_appointment.id,
                  suburb_id: @personal_doctor.suburb_id ,
                  active_status: true,
                  del_status: false
                )
                
                if @confirmed_pds.save!

                  pre_appointment_id = @confirmed_appointment.pre_appointment_id
                  pre_appointment = PreAppointment.find(pre_appointment_id)
                  user_number =  pre_appointment.person_info.person_contact_infos[0].contact_number
                  user_email =  pre_appointment.person_info.person_contact_infos[0].email

                  if pre_appointment.appointment_type_id == "MA" or pre_appointment.appointment_type_id == "PD"
                    message = "Dear, #{pre_appointment.person_info.other_names}, your appointment on Ghinger Health Care has been sent to doctors for acceptance. You will be notified once a doctor accepts. "
                      # send sms
                   sendmsg(user_number,message)
                  else
                    message = "Dear, #{pre_appointment.person_info.other_names}, the billing for an appointment on Ghinger Health Care is ready. Kindly log on to Ghinger and approve the bill for the appointment."

                      # send sms
                   sendmsg(user_number,message)
                  end

               

                  # send email
             



                end
            end
          end

          # pop up billing form
              if @appt_type == "LA" or @appt_type == "MD"
                @patient_billing_info = PatientBillingInfo.new
                @patient_billing_info.billing_info_bill_items.build

                if @appt_type == "LA"
                  @lab_details = LabDetail.where(confirmed_appt_id: @confirmed_appt_id )
                  logger.info "Lab details #{@lab_details.inspect}"

                  @labs = LabService.joins(:service_fee_masters).order("lab_services.title")
                          .where("lab_services.title ilike? and lab_services.active_status =? and lab_services.del_status =?
                          and service_fee_masters.active_status =? and service_fee_masters.del_status =?",
                          "%#{params[:item_id]}", true, false, true, false)
                  @lab_list = @labs.map { |a|[a.title+" ",a.id]  }

                elsif @appt_type == "MD"
                  @med_details = MedicationDetail.where(confirmed_appt_id: @confirmed_appt_id)
                  logger.info "Med details #{@med_details.inspect}"

                  @meds = DrugMaster.joins(:drug_prices).order("drug_masters.drug_name")
                          .where("drug_masters.drug_name ilike ? and drug_masters.active_status =?
                           and drug_masters.del_status =? and drug_prices.active_status =? and drug_prices.del_status =? ",
                          "%#{params[:item_id]}", true, false, true, false)
                      # PersonInfo.order(:surname).where("surname like ? and person_type_id = ?" , "%#{params[:nurse_id]}", "N" )

                  @med_list = @meds.map { |a|[a.drug_name+" ",a.id]  }

                  @price = @meds.map {|a|[a.drug_prices[0].price]}
                  logger.info "####################################"
                  logger.info "Price for each #{@price.inspect}"
                  logger.info "####################################"
                end

              elsif @appt_type == "MA"
                  paid = false
                  approval_status = 1
                  approval_date = Time.now
                  payment_status = 1
                  payment_date = Time.now

                  patient_billing_info = PatientBillingInfo.new(
                      appointment_id: @confirmed_appt_id,
                      approval_status: approval_status,
                      approval_date: approval_date,
                      payment_status: payment_status,
                      payment_date: payment_date,
                      user_id: current_user.id,
                      active_status: true,
                      del_status: false
                  )
                  if patient_billing_info.save
                    billing_info_id = patient_billing_info.id
                    # insert into the billing info item bills
                    bill_item = BillingInfoBillItem.new(
                        billing_info_id: billing_info_id,
                        item_price: 0,
                        user_id: current_user.id,
                        active_status: true,
                        del_status: false
                    )
                  end
                if bill_item.save
                  @confirmed_appointment.update_attribute('paid', paid)
                end

              end
          # pop up billing form
            
          
           format.js { flash.now[:notice] = "Appointment was successfully confirmed." }
           format.html { redirect_to @confirmed_appointment, notice: 'Confirmed appointment was successfully created.' }
           format.json { render :show, status: :created, location: @confirmed_appointment }
        else
          @provider_masters = ProviderMaster.order(:provider_name).where("provider_name like ?", "%#{params[:provider_id]}")
          @suburb_masters = SuburbMaster.order(:suburb_name).where("suburb_name like ?", "%#{params[:suburb_id]}" )    
          @doctors = PersonInfo.order(:surname).where("surname like ? and person_type_id = ?" , "%#{params[:doctor_id]}", "D" )
          @nurses = PersonInfo.order(:surname).where("surname like ? and person_type_id = ?" , "%#{params[:nurse_id]}", "N" )
          
          @the_list = @provider_masters.map { |a|[a.provider_name+" ",a.id]  }
          @loc_list = @suburb_masters.map { |a|[a.suburb_name+" ",a.id]  }
          @doc_list = @doctors.map { |a|[a.surname+" "+a.other_names+" ",a.id]  }
          @nurse_list = @nurses.map { |a|[a.surname+" "+a.other_names+" ",a.id]  }
          
          
          @selected_pre_appointment = PreAppointment.find(@pre_appointment_id)
          @provider = @selected_pre_appointment.provider_master.provider_name if @selected_pre_appointment.provider_master
          @proposed_date = @selected_pre_appointment.proposed_date.strftime("%F %R") if @selected_pre_appointment.proposed_date
          @proposed_loc = @selected_pre_appointment.suburb_master.suburb_name if @selected_pre_appointment.suburb_master
          
           @condition_masters = ConditionMaster.all
           @confirmed_conditions = ConfirmedCondition.all
           #Disable conditions for now
           # @confirmed_appointment.confirmed_conditions.build

           # //for lab appointments
          @lab_services = ServiceFeeMaster.where(appt_type_id: "LA", active_status: true, del_status: false)
          @lab_details = LabDetail.all
          @lab_details_list = LabDetail.joins(:lab_service).where("lab_details.pre_appointment_id = #{@pre_appointment_id} and lab_details.del_status = false")

           # for medication and presciption
          @med_services = DrugPrice.where(active_status: true, del_status: false)
          @med_details = MedicationDetail.all

          format.js { render :new}
          format.html { render :new }
          format.json { render json: @confirmed_appointment.errors, status: :unprocessable_entity }
        end         
   end     
end


  # PATCH/PUT /confirmed_appointments/1
  # PATCH/PUT /confirmed_appointments/1.json
  def update
    respond_to do |format|
      if @confirmed_appointment.update(confirmed_appointment_params)
        format.js { flash.now[:notice] = "Appointment was successfully updated." }
        format.html { redirect_to @confirmed_appointment, notice: 'Confirmed appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @confirmed_appointment }
      else
        @provider_masters = ProviderMaster.order(:provider_name).where("provider_name like ?", "%#{params[:provider_id]}")
        @suburb_masters = SuburbMaster.order(:suburb_name).where("suburb_name like ?", "%#{params[:suburb_id]}" )    
        
        @pre_appointment_id = @confirmed_appointment.pre_appointment_id
        @selected_pre_appointment = PreAppointment.find(@pre_appointment_id)
        logger.info "Selected pre appointment id #{@selected_pre_appointment.inspect}"
        
        @the_list = @provider_masters.map { |a|[a.provider_name+" ",a.id]  }
        @loc_list = @suburb_masters.map { |a|[a.suburb_name+" ",a.id]  }
        
        @condition_masters = ConditionMaster.all
        @confirmed_conditions = ConfirmedCondition.all
        
        format.js { render :edit }
        format.html { render :edit }
        format.json { render json: @confirmed_appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /confirmed_appointments/1
  # DELETE /confirmed_appointments/1.json
  def destroy
    @confirmed_appointment.destroy
    respond_to do |format|
      format.html { redirect_to confirmed_appointments_url, notice: 'Confirmed appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_confirmed_appointment
      @confirmed_appointment = ConfirmedAppointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def confirmed_appointment_params
      params.require(:confirmed_appointment).permit(:pre_appointment_id, :provider_id, :complaint_desc, :confirmed_date, :confirmed_time, :comment, :user_id, :entity_id, :active_status, :del_status, :suburb_id, :doctor_id, :patient_id, :nurse_id, :attended_to, :paid, confirmed_conditions_attributes: [:id, :confirmed_appointment_id, :condition_id, :allergy_id, :comment, :user_id, :entity, :active_status, :del_status] )
    end
end
