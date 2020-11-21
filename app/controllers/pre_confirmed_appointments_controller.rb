class PreConfirmedAppointmentsController < ApplicationController
  before_action :set_pre_confirmed_appointment, only: [:show, :edit, :update, :destroy]
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




  # GET /pre_confirmed_appointments
  # GET /pre_confirmed_appointments.json
  def index
     @pre_confirmed_appointments = PreConfirmedAppointment.select('DISTINCT ON ("pre_appointment_id") *').paginate(:page => params[:page], :per_page => 10).order('pre_appointment_id desc', 'created_at desc')
    
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
      @per_page = params[:per_page] || PreConfirmedAppointment.per_page || 10
      @pre_confirmed_appointments = PreConfirmedAppointment.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || PreConfirmedAppointment.per_page || 10
   page = if params[:page]
            params[:page].to_i
           else
            1 
           end
   

         
# Filter 
  if params[:provider_name]
    @provider_name = params[:provider_name]
    logger.info "The provider is #{@provider_name.inspect}"
    @pre_confirmed_appointments = PreConfirmedAppointment.joins(:provider_master).where(provider_masters: {provider_name: @provider_name}).paginate( :page => params[:page], :per_page => 10).order('id desc')

  elsif params[:category]
    @category = params[:category]
    logger.info "The category is #{@category.inspect}"
    @pre_confirmed_appointments = PreConfirmedAppointment.joins(:request_category).where(request_categories: {category: @category}).paginate( :page => params[:page], :per_page => 10).order('id desc')

  elsif params[:title]
    @type = params[:title]
    logger.info "The type is #{@type.inspect}"
    @pre_confirmed_appointments = PreConfirmedAppointment.joins(:appointment_type).where(appointment_types: {title: @type}).paginate( :page => params[:page], :per_page => 10).order('id desc')

  elsif params[:user_type_title]
    @person_type = params[:user_type_title]
    logger.info "Then person is #{@person_type.inspect}"
    @person_type_info = PersonTypeMaster.where(user_type_title: @person_type)
    @person_type_ref = @person_type_info.last.ref_id
    @pre_appointments = PreConfirmedAppointment.select('DISTINCT ON ("pre_appointment_id") *').joins(:person_type_master).where(person_type_masters:  {ref_id: @person_type_ref}).paginate( :page => params[:page], :per_page => 10).order('created_at desc')


  end


    if params[:patient]
      @pre_confirmed_appointments = PreConfirmedAppointment.select('DISTINCT ON ("pre_appointment_id") *').patient_search(params[:patient]).paginate( :page => params[:page], :per_page => 10)
      logger.info "HELEOELEOELEOELEOELEOELEOELEOELEOELEOELEO"
    elsif params[:doctor]
      @pre_confirmed_appointments = PreConfirmedAppointment.select('DISTINCT ON ("pre_appointment_id") *').doctor_search(params[:doctor]).paginate( :page => params[:page], :per_page => 10)
    elsif params[:nurse]
      @pre_confirmed_appointments = PreConfirmedAppointment.select('DISTINCT ON ("pre_appointment_id") *').nurse_search(params[:nurse]).paginate( :page => params[:page], :per_page => 10)
    elsif params[:pharmacist]
      @person_infos = PersonInfo.pharmacist_search(params[:pharmacist]).paginate( :page => params[:page], :per_page => 10).order('created_at desc')
    elsif params[:laboratorist]
      @person_infos = PersonInfo.laboratorist_search(params[:laboratorist]).paginate( :page => params[:page], :per_page => 10).order('created_at desc')
    end




    respond_to do |format|
      logger.info "what is the url calling this??: ans #{request.referer}"
      format.js
      format.html
      format.csv { send_data @pre_confirmed_appointments.to_csv(options = {}, page, perpage)}
      format.xls { send_data @pre_confirmed_appointments.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    
  end

  # GET /pre_confirmed_appointments/1
  # GET /pre_confirmed_appointments/1.json
  def show
  end
  
  def pre_confirmed_appointment_details
    @appt_id = params[:appt_id]
    logger.info  @appt_id.inspect
    @pre_confirmed_appointment = PreConfirmedAppointment.find(@appt_id)
  end
  
  def doctor_awaiting_appointments
     @doctor_id = current_user.person_info.id
     @nurse_id = current_user.person_info.id
     logger.info "Docoter id = #{@doctor_id.inspect}"
     
     if current_user.person_info.person_type_id == 'D'    
         @doctor_general_appointments = PreConfirmedAppointment.joins(:pre_appointment).where('pre_confirmed_appointments.doctor_id =? AND pre_confirmed_appointments.accepted_status =? AND  pre_confirmed_appointments.closed =? AND pre_confirmed_appointments.decline_status =? AND
         ( pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? ) ', @doctor_id, false, false, false, 'MD', 'VC', 'HC').order('created_at desc')
         
         @doctor_pds_appointments = PreConfirmedAppointment.joins(:pre_appointment).where('pre_confirmed_appointments.doctor_id =? AND pre_confirmed_appointments.accepted_status =? AND  pre_confirmed_appointments.closed =? AND pre_confirmed_appointments.decline_status =? AND
         ( pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? ) ', @doctor_id, false, false, false, 'PC', 'PDDP', 'PDVC', 'PDHC', 'PD').order('created_at desc')
     
     elsif current_user.person_info.person_type_id == 'N' 
        @doctor_general_appointments = PreConfirmedAppointment.joins(:pre_appointment).where('pre_confirmed_appointments.nurse_id =? AND pre_confirmed_appointments.accepted_status =? AND  pre_confirmed_appointments.closed =? AND pre_confirmed_appointments.decline_status =? AND
         ( pre_appointments.appointment_type_id =? ) ', @nurse_id, false, false, false, 'HC').order('created_at desc')    
     end
     logger.info "Doctors general appts are #{@doctor_general_appointments.inspect}"
     logger.info "Doctors pds appts are #{@doctor_pds_appointments.inspect}"
     
  end
  
  
  # accept general appointment
  def doctor_accept_gen_appt
    @pre_confirmed_appt_id = params[:gen_pre_confirm_appt_id]
    @pre_confirmed_appt = PreConfirmedAppointment.find( @pre_confirmed_appt_id)
    logger.info "doctor selected appointment #{@pre_confirmed_appt.inspect}"
    
    @pre_appt_id = @pre_confirmed_appt.pre_appointment_id
    @pre_appointment = PreAppointment.find(@pre_appt_id)
    logger.info "pre appointment #{@pre_appointment.inspect}"
    
   
    @all_sent_pre_confirmed = PreConfirmedAppointment.where(pre_appointment_id: @pre_appt_id)
    logger.info "all doctors receiving pre confirm appointment #{@all_sent_pre_confirmed.inspect}"
    
    @doctor_id = @pre_confirmed_appt.doctor_id
    @nurse_id = @pre_confirmed_appt.nurse_id
    
    logger.info "Doctor id #{@doctor_id.inspect}"
    logger.info "Nurse id #{@nurse_id.inspect}"
    
    done = false
    
    @closed_status = @all_sent_pre_confirmed[0].closed
    
    if @closed_status == true
        respond_to do |format|
            format.js { flash.now[:danger] = "Sorry the appointment is no more available." }
            doctor_awaiting_appointments
        end
    else
      
        if @doctor_id.present?
           insert_into_confirmed_appt = ConfirmedAppointment.new(
              pre_appointment_id: @pre_appt_id,
              complaint_desc: @pre_appointment.complaint_desc,
              confirmed_date: @pre_confirmed_appt.date_time,
              suburb_id: @pre_appointment.suburb_id,
              doctor_id: current_user.person_info.id,
              patient_id: @pre_appointment.requester_id,
              attended_to: false,
              active_status: true,
              del_status: false
          )
          
          if insert_into_confirmed_appt.save!
            @pre_appointment.update_attribute('confirm_status', true)
            @pre_confirmed_appt.update_attribute('accepted_status', true)
            @all_sent_pre_confirmed.update_all(closed: true)
            done = true
          end
          
        elsif @nurse_id.present?
           insert_into_confirmed_appt = ConfirmedAppointment.new(
              pre_appointment_id: @pre_appt_id,
              complaint_desc: @pre_appointment.complaint_desc,
              confirmed_date: @pre_confirmed_appt.date_time,
              suburb_id: @pre_appointment.suburb_id,
              nurse_id: current_user.person_info.id,
              patient_id: @pre_appointment.requester_id,
              attended_to: false,
              active_status: true,
              del_status: false
          )
          
          if insert_into_confirmed_appt.save!
            
            @pre_appointment.update_attribute('confirm_status', true)
            @pre_confirmed_appt.update_attribute('accepted_status', true)
            @all_sent_pre_confirmed.update_all(closed: true)
            done = true
          end
        
       end
       
       respond_to do |format|
        if done == true
          format.js { flash.now[:notice] = "Appointment accepted successfully." }
          @doctor_id = current_user.person_info.id
            @doctor_general_appointments = PreConfirmedAppointment.joins(:pre_appointment).where('pre_confirmed_appointments.doctor_id =? AND pre_confirmed_appointments.accepted_status =? AND  pre_confirmed_appointments.closed =? AND pre_confirmed_appointments.decline_status =? AND
             ( pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? ) ', @doctor_id, false, false, false, 'MD', 'VC', 'HC').order('created_at desc')
     
            @doctor_pds_appointments = PreConfirmedAppointment.joins(:pre_appointment).where('pre_confirmed_appointments.doctor_id =? AND pre_confirmed_appointments.accepted_status =? AND  pre_confirmed_appointments.closed =? AND pre_confirmed_appointments.decline_status =? AND
            ( pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? ) ', @doctor_id, false, false, false, 'PC', 'PDDP', 'PDVC', 'PDHC').order('created_at desc')
     
        end
      end
    
    end
  
  end
  
  # Doctor accept pds appointemnt
  def doctor_accept_pds_appt
    @pre_confirmed_appt_id = params[:pds_pre_confirm_appt_id]
    @pre_confirmed_appt = PreConfirmedAppointment.find( @pre_confirmed_appt_id)
    logger.info "doctor selected appointment #{@pre_confirmed_appt.inspect}"
    
    @pre_appt_id = @pre_confirmed_appt.pre_appointment_id
    @pre_appointment = PreAppointment.find(@pre_appt_id)
    logger.info "pre appointment #{@pre_appointment.inspect}"
    
   
    @all_sent_pre_confirmed = PreConfirmedAppointment.where(pre_appointment_id: @pre_appt_id)
    logger.info "all doctors receing pre confirm appointment #{@all_sent_pre_confirmed.inspect}"
    
    @doctor_id = @pre_confirmed_appt.doctor_id
    @nurse_id = @pre_confirmed_appt.nurse_id
    
    logger.info "Doctor id #{@doctor_id.inspect}"
    logger.info "Nurse id #{@nurse_id.inspect}"
    
     done = false
    
    @closed_status = @all_sent_pre_confirmed[0].closed
    
    if @closed_status == true
        respond_to do |format|
            format.js { flash.now[:danger] = "Sorry the appointment is no more available." }
            doctor_awaiting_appointments
        end
    else
      
        if @doctor_id.present?
           insert_into_confirmed_appt = ConfirmedAppointment.new(
              pre_appointment_id: @pre_appt_id,
              complaint_desc: @pre_appointment.complaint_desc,
              confirmed_date: @pre_confirmed_appt.date_time,
              suburb_id: @pre_appointment.suburb_id,
              doctor_id: current_user.person_info.id,
              patient_id: @pre_appointment.requester_id,
              attended_to: false,
              active_status: true,
              del_status: false
          )
          
          if insert_into_confirmed_appt.save!
             if @pre_appointment.appointment_type_id == "PD"
               cpds = ConfirmedPersonalDoctorService.new(
                doctor_id: current_user.person_info.id,
                patient_id: @pre_appointment.requester_id,
                pre_appointment_id: @pre_appt_id,
                suburb_id: @pre_appointment.suburb_id,
                appointment_type_id: @pre_appointment.appointment_type_id,
                active_status: true,
                del_status: false
               )
                if cpds.save!
                  @pre_appointment.update_attribute('confirm_status', true)
                  @pre_confirmed_appt.update_attribute('accepted_status', true)
                  @all_sent_pre_confirmed.update_all(closed: true)
                  done = true  
                end             
             else
              @pre_appointment.update_attribute('confirm_status', true)
              @pre_confirmed_appt.update_attribute('accepted_status', true)
              @all_sent_pre_confirmed.update_all(closed: true)
              done = true   
             end          
          end
          
        elsif @nurse_id.present?
           insert_into_confirmed_appt = ConfirmedAppointment.new(
              pre_appointment_id: @pre_appt_id,
              complaint_desc: @pre_appointment.complaint_desc,
              confirmed_date: @pre_confirmed_appt.date_time,
              suburb_id: @pre_appointment.suburb_id,
              nurse_id: current_user.person_info.id,
              patient_id: @pre_appointment.requester_id,
              attended_to: false,
              active_status: true,
              del_status: false
          )
          
          if insert_into_confirmed_appt.save!
            @pre_appointment.update_attribute('confirm_status', true)
            @my_pre_confirmed_nurse.update_attrubute('accepted_status', true)
            @all_sent_pre_confirmed.update_attribute('closed', true)
            done = true
          end
        
       end
       
       respond_to do |format|
        if done == true
          format.js { flash.now[:notice] = "Appointment accepted successfully." }
          @doctor_id = current_user.person_info.id
           @doctor_general_appointments = PreConfirmedAppointment.joins(:pre_appointment).where('pre_confirmed_appointments.doctor_id =? AND pre_confirmed_appointments.accepted_status =? AND  pre_confirmed_appointments.closed =? AND pre_confirmed_appointments.decline_status =? AND
           ( pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? ) ', @doctor_id, false, false, false, 'MD', 'VC', 'HC').order('created_at desc')
           
           @doctor_pds_appointments = PreConfirmedAppointment.joins(:pre_appointment).where('pre_confirmed_appointments.doctor_id =? AND pre_confirmed_appointments.accepted_status =? AND  pre_confirmed_appointments.closed =? AND pre_confirmed_appointments.decline_status =? AND
           ( pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? ) ', @doctor_id, false, false, false, 'PC', 'PDDP', 'PDVC', 'PDHC').order('created_at desc')
     
        end
      end
    
    end
        
  end
  
  # Doctor decline general appointment
    def doctor_decline_gen_appt
       @decline_comment = DeclineComment.new
       @pre_confirmed_appointment_id = params[:gen_pre_confirm_appt_id]
       
       @pre_confirmed_appt = PreConfirmedAppointment.find( @pre_confirmed_appointment_id )
       logger.info "doctor selected appointment #{@pre_confirmed_appt.inspect}"
      
       logger.info "doctor selected appointment id #{@pre_confirmed_appointment_id.inspect}"
      
      @doctor_id = @pre_confirmed_appt.doctor_id
      @nurse_id = @pre_confirmed_appt.nurse_id

    end
    
    # Doctor decline pds appointment
    def doctor_decline_pds_appt
       @decline_comment = DeclineComment.new
       @pre_confirmed_appointment_id = params[:pds_pre_confirm_appt_id]
       @pre_confirmed_appt = PreConfirmedAppointment.find( @pre_confirmed_appointment_id )
      logger.info "doctor selected appointment #{@pre_confirmed_appt.inspect}"
      
      logger.info "doctor selected appointment id #{@pre_confirmed_appointment_id.inspect}"
      
      @doctor_id = @pre_confirmed_appt.doctor_id
      @nurse_id = @pre_confirmed_appt.nurse_id

    end
    
  # Create the decline comment record for general appointment doctor
   def create_gen_decline_comment
     @pre_confirmed_appointment_id = params[:decline_comment][:pre_confirmed_appointment_id]
     @doctor_id = params[:decline_comment][:doctor_id]
     @nurse_id = params[:decline_comment][:nurse_id]
     @available_date = params[:decline_comment][:available_date]
     @comment = params[:decline_comment][:comment]
     @active_status = params[:decline_comment][:active_status]
     @del_status = params[:decline_comment][:del_status]

      logger.info "This is the pre confirmed id #{@pre_confirmed_appointment_id.inspect}"
      logger.info "This is the doc  id #{@doctor_id.inspect}"
      
      if @doctor_id.present?
          @decline_comment = DeclineComment.new(
            pre_confirmed_appointment_id: @pre_confirmed_appointment_id,
            doctor_id: @doctor_id,
            available_date: @available_date,
            comment: @comment,
            active_status: true,
            del_status: false
          )
          
          respond_to do |format|
              if @decline_comment.save
                 @pre_confirmed_appt = PreConfirmedAppointment.find(@pre_confirmed_appointment_id )        
                 @pre_confirmed_appt.update_attribute('decline_status', true)
                 
                 format.js { flash.now[:notice] = "Decline successful"}
                 @doctor_general_appointments = PreConfirmedAppointment.joins(:pre_appointment).where('pre_confirmed_appointments.doctor_id =? AND pre_confirmed_appointments.accepted_status =? AND  pre_confirmed_appointments.closed =? AND pre_confirmed_appointments.decline_status =? AND
                 ( pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? ) ', @doctor_id, false, false, false, 'MD', 'VC', 'HC').order('created_at desc')
                 
                 @doctor_pds_appointments = PreConfirmedAppointment.joins(:pre_appointment).where('pre_confirmed_appointments.doctor_id =? AND pre_confirmed_appointments.accepted_status =? AND  pre_confirmed_appointments.closed =? AND pre_confirmed_appointments.decline_status =? AND
                 ( pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? ) ', @doctor_id, false, false, false, 'PC', 'PDDP', 'PDVC', 'PDHC').order('created_at desc')
     
                 
               else
                 # @pre_confirmed_appointment_id =  @pre_confirmed_appointment_id = params[:decline_comment][:pre_confirmed_appointment_id]
                 @pre_confirmed_appt = PreConfirmedAppointment.find( @pre_confirmed_appointment_id )
                 format.js { render :doctor_decline_gen_appt }
                  
              end
          end
            
      elsif @nurse_id.present?
          @decline_comment = DeclineComment.new(
            pre_confirmed_appointment_id: @pre_confirmed_appointment_id,
            nurse_id: @nurse_id,
            available_date: @available_date,
            comment: @comment,
            active_status: true,
            del_status: false
          )
          
          respond_to do |format|
              if @decline_comment.save
                 @pre_confirmed_appt = PreConfirmedAppointment.find(@pre_confirmed_appointment_id )        
                 @pre_confirmed_appt.update_attribute('decline_status', true)
                 
                 format.js { flash.now[:notice] = "Decline successful"}
                 @doctor_general_appointments = PreConfirmedAppointment.joins(:pre_appointment).where('pre_confirmed_appointments.doctor_id =? AND pre_confirmed_appointments.accepted_status =? AND  pre_confirmed_appointments.closed =? AND pre_confirmed_appointments.decline_status =? AND
                 ( pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? ) ', @doctor_id, false, false, false, 'MD', 'VC', 'HC').order('created_at desc')
                 
                 @doctor_pds_appointments = PreConfirmedAppointment.joins(:pre_appointment).where('pre_confirmed_appointments.doctor_id =? AND pre_confirmed_appointments.accepted_status =? AND  pre_confirmed_appointments.closed =? AND pre_confirmed_appointments.decline_status =? AND
                 ( pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? ) ', @doctor_id, false, false, false, 'PC', 'PDDP', 'PDVC', 'PDHC').order('created_at desc')
     
                 
               else
                 # @pre_confirmed_appointment_id =  @pre_confirmed_appointment_id = params[:decline_comment][:pre_confirmed_appointment_id]
                 @pre_confirmed_appt = PreConfirmedAppointment.find( @pre_confirmed_appointment_id )
                 format.js { render :doctor_decline_gen_appt }
                  
              end
          end
        
      end
      
   end   
   
   
    # Create the decline comment record for pds appointment doctor
   def create_pds_decline_comment
     @pre_confirmed_appointment_id = params[:decline_comment][:pre_confirmed_appointment_id]
     @doctor_id = params[:decline_comment][:doctor_id]
     @nurse_id = params[:decline_comment][:nurse_id]
     @available_date = params[:decline_comment][:available_date]
     @comment = params[:decline_comment][:comment]
     @active_status = params[:decline_comment][:active_status]
     @del_status = params[:decline_comment][:del_status]

      logger.info "This is the pre confirmed id #{@pre_confirmed_appointment_id.inspect}"
      logger.info "This is the doc  id #{@doctor_id.inspect}"
      
      if @doctor_id.present?
          @decline_comment = DeclineComment.new(
            pre_confirmed_appointment_id: @pre_confirmed_appointment_id,
            doctor_id: @doctor_id,
            available_date: @available_date,
            comment: @comment,
            active_status: true,
            del_status: false
          )
          
          respond_to do |format|
              if @decline_comment.save
                 @pre_confirmed_appt = PreConfirmedAppointment.find(@pre_confirmed_appointment_id )        
                 @pre_confirmed_appt.update_attribute('decline_status', true)
                 
                 format.js { flash.now[:notice] = "Decline successful"}
                 @doctor_general_appointments = PreConfirmedAppointment.joins(:pre_appointment).where('pre_confirmed_appointments.doctor_id =? AND pre_confirmed_appointments.accepted_status =? AND  pre_confirmed_appointments.closed =? AND pre_confirmed_appointments.decline_status =? AND
                 ( pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? ) ', @doctor_id, false, false, false, 'MD', 'VC', 'HC').order('created_at desc')
                 
                 @doctor_pds_appointments = PreConfirmedAppointment.joins(:pre_appointment).where('pre_confirmed_appointments.doctor_id =? AND pre_confirmed_appointments.accepted_status =? AND  pre_confirmed_appointments.closed =? AND pre_confirmed_appointments.decline_status =? AND
                 ( pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? ) ', @doctor_id, false, false, false, 'PC', 'PDDP', 'PDVC', 'PDHC').order('created_at desc')
     
                 
               else
                 # @pre_confirmed_appointment_id =  @pre_confirmed_appointment_id = params[:decline_comment][:pre_confirmed_appointment_id]
                 @pre_confirmed_appt = PreConfirmedAppointment.find( @pre_confirmed_appointment_id )
                 format.js { render :doctor_decline_gen_appt }
                  
              end
          end
            
      elsif @nurse_id.present?
          @decline_comment = DeclineComment.new(
            pre_confirmed_appointment_id: @pre_confirmed_appointment_id,
            nurse_id: @nurse_id,
            available_date: @available_date,
            comment: @comment,
            active_status: true,
            del_status: false
          )
          
          respond_to do |format|
              if @decline_comment.save
                 @pre_confirmed_appt = PreConfirmedAppointment.find(@pre_confirmed_appointment_id )        
                 @pre_confirmed_appt.update_attribute('decline_status', true)
                 
                 format.js { flash.now[:notice] = "Decline successful"}
                 @doctor_general_appointments = PreConfirmedAppointment.joins(:pre_appointment).where('pre_confirmed_appointments.doctor_id =? AND pre_confirmed_appointments.accepted_status =? AND  pre_confirmed_appointments.closed =? AND pre_confirmed_appointments.decline_status =? AND
                 ( pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? ) ', @doctor_id, false, false, false, 'MD', 'VC', 'HC').order('created_at desc')
                 
                 @doctor_pds_appointments = PreConfirmedAppointment.joins(:pre_appointment).where('pre_confirmed_appointments.doctor_id =? AND pre_confirmed_appointments.accepted_status =? AND  pre_confirmed_appointments.closed =? AND pre_confirmed_appointments.decline_status =? AND
                 ( pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? OR pre_appointments.appointment_type_id =? ) ', @doctor_id, false, false, false, 'PC', 'PDDP', 'PDVC', 'PDHC').order('created_at desc')
     
                 
               else
                 # @pre_confirmed_appointment_id =  @pre_confirmed_appointment_id = params[:decline_comment][:pre_confirmed_appointment_id]
                 @pre_confirmed_appt = PreConfirmedAppointment.find( @pre_confirmed_appointment_id )
                 format.js { render :doctor_decline_gen_appt }
                  
              end
          end
        
      end
      
   end 
   
   
   def decline_note
     @pre_confirm_id = params[:pre_confirm_id]
     @doctor_id = params[:doc]
     @pre_confirm = PreConfirmedAppointment.find(@pre_confirm_id)
     logger.info "pre confirm is #{@pre_confirm.inspect}"
     @decline_comment = DeclineComment.where(pre_confirmed_appointment_id: @pre_confirm_id, doctor_id: @doctor_id)[0]
     logger.info "This is the decline comment #{@decline_comment.inspect}"
   end
   
   
   
  # GET /pre_confirmed_appointments/new
  def new
    @pre_appointment_id = params[:pre_appointment_id]
    logger.info "#############################HERE IS THE PRE APPOINTMENT ID###############"
    logger.info "Pre appointment id: #{@pre_appointment_id.inspect}"
    
     @selected_pre_appointment = PreAppointment.find(@pre_appointment_id)

     @provider = @selected_pre_appointment.provider_master.provider_name if @selected_pre_appointment.provider_master
     @proposed_date = @selected_pre_appointment.proposed_date.strftime("%F %R") if @selected_pre_appointment.proposed_date
     @proposed_loc = @selected_pre_appointment.suburb_master.suburb_name if @selected_pre_appointment.suburb_master
     @prefered_doc = @selected_pre_appointment.pd_name if @selected_pre_appointment.pd_name
    
     suburb_id = @selected_pre_appointment.suburb_id
    
       
    if @prefered_doc.present?  
      logger.info 
      logger.info "##########################"
      logger.info "Suburb id is #{suburb_id.inspect}"
      logger.info "##########################"
      
      region = RegionMaster.joins("left join city_town_masters on region_masters.id = city_town_masters.region_id left join suburb_masters on city_town_masters.id = suburb_masters.city_town_id")
                            .where("suburb_masters.id =? and city_town_masters.active_status =? and suburb_masters.active_status =? and region_masters.active_status =?", suburb_id, true, true, true)[0]
      region_id = region.id
      logger.info 
      logger.info "##########################"
      logger.info "region join is #{region.inspect}"
      logger.info "##########################"
      
      @doctors = PersonInfo.joins("left join users on person_infos.id = users.person_id left join person_contact_infos on person_infos.id = person_contact_infos.person_id left join suburb_masters on person_contact_infos.suburb_id = suburb_masters.id left join city_town_masters on suburb_masters.city_town_id = city_town_masters.id left join region_masters on city_town_masters.region_id = region_masters.id")
                 .order("person_infos.surname").where("person_infos.surname ilike ? and person_infos.person_type_id = ? and users.active_status =? and region_masters.id =?" , "%#{params[:doctor_id]}", "D", true, region_id)
      
      logger.info @doctors.inspect
      
    elsif @selected_pre_appointment.appointment_type_id == "VC" or @selected_pre_appointment.appointment_type_id == "HC"
      @doctors = PersonInfo.joins(:user).order('person_infos.surname').where("person_infos.surname ilike ? and person_infos.person_type_id = ? and users.active_status =?" , "%#{params[:doctor_id]}", "D", true )

       elsif @selected_pre_appointment.appointment_type_id == "PD" 
      @doctors = PersonInfo.joins(:user).order('person_infos.surname').where("person_infos.surname ilike ? and person_infos.person_type_id = ? and users.active_status =?" , "%#{params[:doctor_id]}", "D", true )
    elsif @selected_pre_appointment.appointment_type_id == "PC" or @selected_pre_appointment.appointment_type_id == "PDVC" or @selected_pre_appointment.appointment_type_id == "PDDP" or @selected_pre_appointment.appointment_type_id == "PDHC"
     @doctors = PersonInfo.joins("left join users on person_infos.id = users.person_id left join person_contact_infos on person_infos.id = person_contact_infos.person_id ")
                 .order("person_infos.surname").where("person_infos.surname ilike ? and person_infos.person_type_id = ? and users.active_status =? " , "%#{params[:doctor_id]}", "D", true)
    else
     @doctors = PersonInfo.joins("left join users on person_infos.id = users.person_id left join person_contact_infos on person_infos.id = person_contact_infos.person_id left join suburb_masters on person_contact_infos.suburb_id = suburb_masters.id")
                 .order("person_infos.surname").where("person_infos.surname ilike ? and person_infos.person_type_id = ? and users.active_status =? and suburb_masters.id =?" , "%#{params[:doctor_id]}", "D", true, suburb_id)
        
    end
   

    @nurses = PersonInfo.joins(:user).order('person_infos.surname').where("person_infos.surname ilike ? and person_infos.person_type_id = ? and users.active_status =?" , "%#{params[:nurse_id]}", "N", true )
    
  
    @doc_list = @doctors.map { |a|[a.surname+" "+a.other_names+" ",a.id]  }
    @nurse_list = @nurses.map { |a|[a.surname+" "+a.other_names+" ",a.id]  }



     logger.info "DOC PARAMS #{params[:doctor_id]}" 
     logger.info "NURSE PARAMS #{params[:nurse_id]}" 
       logger.info "DOC LIST IS  #{@doctors.inspect}" 
       logger.info "NURSE LIST IS  #{@nurse_list.inspect}" 
    
     
     
     logger.info "Selected Pre appointment is: #{@selected_pre_appointment.inspect}"
     logger.info "Service provider is: #{@provider.inspect}"
     logger.info "Relations is: #{@selected_pre_appointment.suburb_master.inspect}"
     suburb = @selected_pre_appointment.suburb_master.suburb_name if @selected_pre_appointment.suburb_master
     logger.info "Suburbis: #{suburb.inspect}"
     
     @patient_id = @selected_pre_appointment.requester_id
     @personal_doctor = ConfirmedPersonalDoctorService.where(appointment_type_id: 'PD', patient_id: @patient_id)[0]
     logger.info "Personal doctor #{@personal_doctor.inspect}"


    # check if the appointment has price set
    @apt_type = @selected_pre_appointment.appointment_type_id
    req_urgency = @selected_pre_appointment.req_urgency

     logger.info "apt_type #{@apt_type.inspect}"
    if @apt_type == "HC" or @apt_type == "PC" or @apt_type == "VC" or @apt_type == "PDHC" or @apt_type == "PDVC" or @apt_type == "PDDP" or @apt_type == "PD"
        if req_urgency == "S"
          @price = ServiceFeeMaster.where(appt_type_id: @apt_type, req_urgency: "S", active_status: true, del_status: false)[0]

          logger.info "price #{@price.inspect}"
        elsif req_urgency == "E"
          @price = ServiceFeeMaster.where(appt_type_id: @apt_type, req_urgency: "E", active_status: true, del_status: false)[0]

          logger.info "price #{@price.inspect}"

          elsif @apt_type == "PD"
      @price = 0.00

        end
    end

      @pre_confirmed_appointment = PreConfirmedAppointment.new


  end

  # GET /pre_confirmed_appointments/1/edit
  def edit
    @id = params[:id]
    @pre_confirm = PreConfirmedAppointment.find(@id)
    @pre_appointment_id = @pre_confirm.pre_appointment_id
    logger.info "#############################HERE IS THE PRE APPOINTMENT ID###############"
    logger.info "Pre appointment id: #{@pre_appointment_id.inspect}"
    
    # @provider_masters = ProviderMaster.order(:provider_name).where("provider_name like ?", "%#{params[:provider_id]}")
    # @suburb_masters = SuburbMaster.order(:suburb_name).where("suburb_name like ?", "%#{params[:suburb_id]}" )    
    @doctors = PersonInfo.order(:surname).where("surname like ? and person_type_id = ?" , "%#{params[:doctor_id]}", "D" )
    @nurses = PersonInfo.order(:surname).where("surname like ? and person_type_id = ?" , "%#{params[:nurse_id]}", "N" )
    
    # @the_list = @provider_masters.map { |a|[a.provider_name+" ",a.id]  }
    # @loc_list = @suburb_masters.map { |a|[a.suburb_name+" ",a.id]  }
    @doc_list = @doctors.map { |a|[a.surname+" "+a.other_names+" ",a.id]  }
    @nurse_list = @nurses.map { |a|[a.surname+" "+a.other_names+" ",a.id]  }
    
     @selected_pre_appointment = PreAppointment.find(@pre_appointment_id)
     @provider = @selected_pre_appointment.provider_master.provider_name if @selected_pre_appointment.provider_master
     @proposed_date = @selected_pre_appointment.proposed_date.strftime("%F %R") if @selected_pre_appointment.proposed_date
     @proposed_loc = @selected_pre_appointment.suburb_master.suburb_name if @selected_pre_appointment.suburb_master
     
     logger.info "Selected Pre appointment is: #{@selected_pre_appointment.inspect}"
     logger.info "Service provider is: #{@provider.inspect}"
     logger.info "Relations is: #{@selected_pre_appointment.suburb_master.inspect}"
     suburb = @selected_pre_appointment.suburb_master.suburb_name if @selected_pre_appointment.suburb_master
     logger.info "Suburbis: #{suburb.inspect}"
  end
  
  
  # find doctors and nurses
  def find_doc_nurse
    @pre_appointment_id = params[:pre_appointment_id]    
    @doc_nurse = PreConfirmedAppointment.where(pre_appointment_id: @pre_appointment_id)
    logger.info "doc list is #{@doc_nurse.inspect}"
  end
  
  
  def enable_pre_confirmed_appointment
      appointment_id=params[:chosen]
      pre_app = PreConfirmedAppointment.where(id: appointment_id, accepted_status: false)[0]
     if pre_app.update_attribute('active_status', 1)    
       redirect_to pre_confirmed_appointments_path, notice: 'Appointment was successfully enabled.'
     end
  end
 
 
  def disable_pre_confirmed_appointment
      appointment_id=params[:chosen]     
      pre_app = PreConfirmedAppointment.where(id: appointment_id, accepted_status: false)[0]
     if pre_app.update_attribute('active_status', 0)    
       redirect_to pre_confirmed_appointments_path, notice: 'Appointment was successfully enabled.'
     end    
  end
    

  # POST /pre_confirmed_appointments
  # POST /pre_confirmed_appointments.json
  def create
    ghinger_conn = Connect.new
    # @pre_confirmed_appointment = PreConfirmedAppointment.new(pre_confirmed_appointment_params)
    done = false #if it iterates successfully
    @doctor_ids = pre_confirmed_appointment_params[:doctor_id]
    @nurse_ids = pre_confirmed_appointment_params[:nurse_id]
    @pre_appointment_id = pre_confirmed_appointment_params[:pre_appointment_id]
    @date_time = pre_confirmed_appointment_params[:date_time]
    @patient_id = pre_confirmed_appointment_params[:patient_id]


    @selected_pre_appointment = PreAppointment.find(@pre_appointment_id)

    @provider = @selected_pre_appointment.provider_master.provider_name if @selected_pre_appointment.provider_master
    @proposed_date = @selected_pre_appointment.proposed_date.strftime("%F %R") if @selected_pre_appointment.proposed_date
    @proposed_loc = @selected_pre_appointment.suburb_master.suburb_name if @selected_pre_appointment.suburb_master
    @prefered_doc = @selected_pre_appointment.pd_name if @selected_pre_appointment.pd_name

    
    suburb_id = @selected_pre_appointment.suburb_id


    if @prefered_doc.present?
      logger.info
      logger.info "##########################"
      logger.info "Suburb id is #{suburb_id.inspect}"
      logger.info "##########################"

      region = RegionMaster.joins("left join city_town_masters on region_masters.id = city_town_masters.region_id left join suburb_masters on city_town_masters.id = suburb_masters.city_town_id")
                   .where("suburb_masters.id =? and city_town_masters.active_status =? and suburb_masters.active_status =? and region_masters.active_status =?", suburb_id, true, true, true)[0]
      region_id = region.id
      logger.info
      logger.info "##########################"
      logger.info "region join is #{region.inspect}"
      logger.info "##########################"

      @doctors = PersonInfo.joins("left join users on person_infos.id = users.person_id left join person_contact_infos on person_infos.id = person_contact_infos.person_id left join suburb_masters on person_contact_infos.suburb_id = suburb_masters.id left join city_town_masters on suburb_masters.city_town_id = city_town_masters.id left join region_masters on city_town_masters.region_id = region_masters.id")
                     .order("person_infos.surname").where("person_infos.surname ilike ? and person_infos.person_type_id = ? and users.active_status =? and region_masters.id =?" , "%#{params[:doctor_id]}", "D", true, region_id)

      logger.info @doctors.inspect
   
    elsif @selected_pre_appointment.appointment_type_id == "VC" or @selected_pre_appointment.appointment_type_id == "HC"
      @doctors = PersonInfo.joins(:user).order('person_infos.surname').where("person_infos.surname ilike ? and person_infos.person_type_id = ? and users.active_status =?" , "%#{params[:doctor_id]}", "D", true )
    elsif @selected_pre_appointment.appointment_type_id == "PC" or @selected_pre_appointment.appointment_type_id == "PDVC" or @selected_pre_appointment.appointment_type_id == "PDDP" or @selected_pre_appointment.appointment_type_id == "PDHC"
      @doctors = PersonInfo.joins("left join users on person_infos.id = users.person_id left join person_contact_infos on person_infos.id = person_contact_infos.person_id ")
                     .order("person_infos.surname").where("person_infos.surname ilike ? and person_infos.person_type_id = ? and users.active_status =? " , "%#{params[:doctor_id]}", "D", true)
    else
      @doctors = PersonInfo.joins("left join users on person_infos.id = users.person_id left join person_contact_infos on person_infos.id = person_contact_infos.person_id left join suburb_masters on person_contact_infos.suburb_id = suburb_masters.id")
                     .order("person_infos.surname").where("person_infos.surname ilike ? and person_infos.person_type_id = ? and users.active_status =? and suburb_masters.id =?" , "%#{params[:doctor_id]}", "D", true, suburb_id)

    end


    @nurses = PersonInfo.joins(:user).order('person_infos.surname').where("person_infos.surname ilike ? and person_infos.person_type_id = ? and users.active_status =?" , "%#{params[:nurse_id]}", "N", true )


    @doc_list = @doctors.map { |a|[a.surname+" "+a.other_names+" ",a.id]  }
    @nurse_list = @nurses.map { |a|[a.surname+" "+a.other_names+" ",a.id]  }



    logger.info "Selected Pre appointment is: #{@selected_pre_appointment.inspect}"
    logger.info "Service provider is: #{@provider.inspect}"
    logger.info "Relations is: #{@selected_pre_appointment.suburb_master.inspect}"
    suburb = @selected_pre_appointment.suburb_master.suburb_name if @selected_pre_appointment.suburb_master
    logger.info "Suburbis: #{suburb.inspect}"

    @patient_id = @selected_pre_appointment.requester_id
    @personal_doctor = ConfirmedPersonalDoctorService.where(appointment_type_id: 'PD', patient_id: @patient_id)[0]
    logger.info "Personal doctor #{@personal_doctor.inspect}"


    # check if the appointment has price set
    @apt_type = @selected_pre_appointment.appointment_type_id
    req_urgency = @selected_pre_appointment.req_urgency
    if @apt_type == "HC" or @apt_type == "PC" or @apt_type == "VC" or @apt_type == "PDHC" or @apt_type == "PDVC"
      if req_urgency == "S"
        @price = ServiceFeeMaster.where(appt_type_id: @apt_type, req_urgency: "S", active_status: true, del_status: false)[0]
      elsif req_urgency == "E"
        @price = ServiceFeeMaster.where(appt_type_id: @apt_type, req_urgency: "E", active_status: true, del_status: false)[0]
      end
    end

      logger.info "Doctors #{ @doctor_ids.inspect} "
      if @doctor_ids.present?  
          @doctor_ids.each do |doctor_id|
            logger.info "value is: #{doctor_id}"
            @pre_confirmed_appointment = PreConfirmedAppointment.new(
                 pre_appointment_id: @pre_appointment_id,
                 date_time: @date_time,
                 doctor_id: doctor_id,
                 nurse_id: @nurse_ids,
                 patient_id: @patient_id,
                 user_id: current_user.id ,
                 active_status: true,
                 del_status: false,
                 accepted_status: false,
                 decline_status: false,
                 closed: false
                 
            )
              if @pre_confirmed_appointment.save
                done = true
              else
                  done = false
              end

          end

        if done

          # update pre confirm status for pre appointment
          pre_appointment = PreAppointment.find(@pre_appointment_id)
          pre_appointment.update_attribute(
              'pre_confirm_status', true
          )

          # Now insert into the confirmed appointment table for this appointment
          if pre_appointment.appointment_type_id == "MA" or pre_appointment.appointment_type_id == "PD"
            paid = false
            approval_status = 1
            approval_date = Time.now
            payment_status = 1
            payment_date = Time.now
          else
            paid = nil
            approval_status = nil
            approval_date = nil
            payment_status = 0
            payment_date = nil
          end
          insert_into_confirmed_appt = ConfirmedAppointment.new(
              pre_appointment_id: @pre_appointment_id,
              complaint_desc:  pre_appointment.complaint_desc,
              confirmed_date: @pre_confirmed_appointment.date_time,
              suburb_id:  pre_appointment.suburb_id,
              doctor_id: nil,
              nurse_id: nil,
              patient_id:  pre_appointment.requester_id,
              attended_to: false,
              active_status: true,
              del_status: false,
              paid: paid
          )
          if insert_into_confirmed_appt.save
            @confirmed_appt_id = insert_into_confirmed_appt.id
            # insert into patient_billing info
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
              done = true
            end
          end

        end
          
        elsif @nurse_ids.present?
            @nurse_ids.each do |nurse_id|                
            logger.info "value is: #{nurse_id}"
            @pre_confirmed_appointment = PreConfirmedAppointment.new(
                 pre_appointment_id: @pre_appointment_id,
                 date_time: @date_time,
                 doctor_id: @doctor_ids,
                 nurse_id: nurse_id,
                 patient_id: @patient_id,
                 user_id: current_user.id ,
                 active_status: true,
                 del_status: false,
                 accepted_status: false,
                 decline_status: false,
                 closed: false
                 
            )
             if   @pre_confirmed_appointment.save
               done = true
             else
              done = false
             end
          end

         if done
           pre_appointment = PreAppointment.find(@pre_appointment_id)
           pre_appointment.update_attribute(
               'pre_confirm_status', true
           )
           if pre_appointment.appointment_type_id == "MA" or pre_appointment.appointment_type_id == "PD"
             paid = false
             approval_status = 1
             approval_date = Time.now
             payment_status = 1
             payment_date = Time.now
           else
             paid = nil
             approval_status = nil
             approval_date = nil
             payment_status = 0
             payment_date = nil
           end

           insert_into_confirmed_appt = ConfirmedAppointment.new(
               pre_appointment_id: @pre_appointment_id,
               complaint_desc:  pre_appointment.complaint_desc,
               confirmed_date: @pre_confirmed_appointment.date_time,
               suburb_id:  pre_appointment.suburb_id,
               doctor_id: nil,
               nurse_id: nil,
               patient_id:  pre_appointment.requester_id,
               attended_to: false,
               active_status: true,
               del_status: false,
               paid: paid
           )

           if insert_into_confirmed_appt.save
             @confirmed_appt_id = insert_into_confirmed_appt.id
             # insert into patient_billing info
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
               done = true
             end
           end
         end

       end
    
    logger.info "############################################3"
    logger.info "Done #{done.inspect}"
    logger.info "############################################3"
    respond_to do |format|
      if done
        pre_appointment_id = @pre_confirmed_appointment.pre_appointment_id
        pre_appointment = PreAppointment.find(pre_appointment_id)
        user_number =  pre_appointment.person_info.person_contact_infos[0].contact_number
        user_email =  pre_appointment.person_info.person_contact_infos[0].email

        if pre_appointment.appointment_type_id == "MA" or pre_appointment.appointment_type_id == "PD"
          message = "Dear, #{pre_appointment.person_info.other_names }, your appointment on Ghinger Health Care has been sent to doctors for acceptance. You will be notified once a doctor accepts. "

          
        # send sms
        sendmsg(user_number,message)
        else
          message = "Dear, #{pre_appointment.person_info.other_names}, the billing for an appointment on Ghinger Health Care is ready. Kindly log onto your Ghinger App and approve the bill for the appointment."
          
        # send sms
        sendmsg(user_number,message)
        end

    

        # send email
    




        # send notification
        # if pre_appointment.appointment_type_id == "MA" or pre_appointment.appointment_type_id == "PD"
        # GhingerMailer.payment_request(pre_appointment.person_info, pre_appointment.appointment_type_id).deliver_now
        # else

        # end




        format.js { flash.now[:notice] = "Appointment sent to doctors." }
        # format.html { redirect_to @pre_confirmed_appointment, notice: 'Pre confirmed appointment was successfully created.' }
        format.json { render :show, status: :created, location: @pre_confirmed_appointment }
      else
        @pre_confirmed_appointment = @pre_confirmed_appointment
        format.js { render :new }
        format.json { render json: @pre_confirmed_appointment.errors, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /pre_confirmed_appointments/1
  # PATCH/PUT /pre_confirmed_appointments/1.json
  def update
    respond_to do |format|
      if @pre_confirmed_appointment.update(pre_confirmed_appointment_params)
        format.html { redirect_to @pre_confirmed_appointment, notice: 'Pre confirmed appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @pre_confirmed_appointment }
      else
        format.html { render :edit }
        format.json { render json: @pre_confirmed_appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pre_confirmed_appointments/1
  # DELETE /pre_confirmed_appointments/1.json
  def destroy
    @pre_confirmed_appointment.destroy
    respond_to do |format|
      format.html { redirect_to pre_confirmed_appointments_url, notice: 'Pre confirmed appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pre_confirmed_appointment
      @pre_confirmed_appointment = PreConfirmedAppointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pre_confirmed_appointment_params
      params.require(:pre_confirmed_appointment).permit(:pre_appointment_id, :user_id, :active_status, :del_status, :accepted_status, :patient_id, :decline_status, :date_time, {:doctor_id=> []}, {:nurse_id=> []})
    end
end
