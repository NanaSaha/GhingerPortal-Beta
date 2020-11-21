class PatientMedRecordsController < ApplicationController
  before_action :set_patient_med_record, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  # GET /patient_med_records
  # GET /patient_med_records.json
  def index
    @patient_med_records = PatientMedRecord.all
  end

  # GET /patient_med_records/1
  # GET /patient_med_records/1.json
  def show
  end
  
  # view patient medical records
  def view_patient_med_record
    @doctor_id = params[:doc] 
    @patient_id = params[:chosen]
    @confirmed_appt_id = params[:comfirmed_appt_id]
    @patient_name = PersonInfo.where(id: @patient_id)[0]
    @confirme_appt = ConfirmedAppointment.find(@confirmed_appt_id)
    @appt_type = @confirme_appt.pre_appointment.appointment_type_id
    
    @patient_med_record = PatientMedRecord.where(doctor_id: @doctor_id, patient_id: @patient_id, confirmed_appt_id: @confirmed_appt_id)[0]
    
  end

  # GET /patient_med_records/new
  def new
    @doctor_id = params[:doc] 
    @patient_id = params[:chosen]
    @confirmed_appt_id = params[:comfirmed_appt_id]
    @patient_name = PersonInfo.where(id: @patient_id)[0]
    
    @confirmed_appt = ConfirmedAppointment.find(@confirmed_appt_id)
    @appointment_type_id = @confirmed_appt.pre_appointment.appointment_type_id
    
    logger.info "Patient is #{@patient_name.inspect}"
    @patient_med_record = PatientMedRecord.new
    
  end
  
  
  # Attend to general appointment
  def attend_to_patient_med_record
    @doctor_id = params[:doc] 
    @patient_id = params[:chosen]
    @confirmed_appt_id = params[:comfirmed_appt_id]
    @patient_name = PersonInfo.where(id: @patient_id)[0]   
    @confirme_appt = ConfirmedAppointment.find(@confirmed_appt_id)
    @appt_type = @confirme_appt.pre_appointment.appointment_type_id
    
    logger.info "Patient is #{@patient_name.inspect}"
    
    @patient_med_record = PatientMedRecord.new
  end
  
  # create patient med record
  def create_patient_med_record   
    @patient_med_record = PatientMedRecord.new(patient_med_record_params)
    
    respond_to do |format|
      if @patient_med_record.save
        @confirmed_appt_id = patient_med_record_params[:confirmed_appt_id]
        @patient_id = patient_med_record_params[:patient_id]
        @doctor_id = patient_med_record_params[:doctor_id]
        confirmed_appt = ConfirmedAppointment.where(id: @confirmed_appt_id)[0]
        @appt_type = confirmed_appt.pre_appointment.appointment_type_id
        logger.info "Confirmed appt is #{confirmed_appt.inspect}"
        @patient_name = PersonInfo.where(id: @patient_id)[0] 
        
              
        @doctor_video_appointments = ConfirmedAppointment.joins(:pre_appointment).where('confirmed_appointments.doctor_id =? AND (pre_appointments.appointment_type_id =? ) ', @doctor_id, 'VC' ).order('created_at desc') 
        @doctor_home_appointments = ConfirmedAppointment.joins(:pre_appointment).where('confirmed_appointments.doctor_id =? AND (pre_appointments.appointment_type_id =? ) ', @doctor_id, 'HC' ).order('created_at desc')
        @doctor_medication_appointments = ConfirmedAppointment.joins(:pre_appointment).where('confirmed_appointments.doctor_id =? AND (pre_appointments.appointment_type_id =? ) ', @doctor_id, 'MD' ).order('created_at desc')
        
                
         confirmed_appt.update_attribute(
            'attended_to', true
          )
          format.js {flash.now[:notice] = "Appointment attended to successfully"}
          format.html { redirect_to find_patient_details_path(:chosen => @patient_id, :doc =>  @doctor_id ), notice: 'Patient med record was successfully created.' }
          format.json { render :show, status: :created, location: @patient_med_record }

        
      else
        format.js { render :attend_to_patient_med_record }
        format.html { render :new }
        format.json { render json: @patient_med_record.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # GET /patient_med_records/1/edit
  def edit
  end
  
  def patient_confirmed_unattended_to_appt
    @doctor_id = params[:doctor_id]
    @patient_id = params[:patient_id]
    
    @patient_unattended_appts = ConfirmedAppointment.joins(:pre_appointment).where("pre_appointments.appointment_type_id !=? and confirmed_appointments.patient_id =? and confirmed_appointments.doctor_id =? and confirmed_appointments.attended_to =?", 'PD', @patient_id, @doctor_id, false).order('confirmed_appointments.created_at desc')   
    
   # @patient_unattended_appts = ConfirmedAppointment.where(patient_id: @patient_id, doctor_id: @doctor_id, attended_to: false)
   # .paginate(:page => params[:page], :per_page => 3).order('created_at desc')
   logger.info "Unattended to appts #{@patient_unattended_appt.inspect}"
   
   respond_to do |format|
     format.html
   end
   
  end
  
  
  def record_detail
    @confirmed_appt_id = params[:confirmed_appt_id]
    @confirmed_appt = ConfirmedAppointment.find(@confirmed_appt_id)
    logger.info "Confirmed appt #{@confirmed_appt.inspect}"
    
    @patient_med_record =  PatientMedRecord.where(confirmed_appt_id: @confirmed_appt_id)[0]
    logger.info "Medical Record #{@patient_med_record.inspect}"
       
  end
  
  
  def patient_unordered_record
    @patient_id = params[:patient_id]
    @doctor_id = params[:doctor_id]
    
    @unordered_records = PatientMedRecord.where(patient_id: @patient_id, doctor_id: @doctor_id, order_status: false)
       
  end
  
  def order_treatment
    @patient_id = params[:patient_id]
    @doctor_id = params[:doctor_id]
    @record_id = params[:record_id]
    
    @record = PatientMedRecord.where(id: @record_id, patient_id: @patient_id, doctor_id: @doctor_id, order_status: false)[0]
    
    if @record
      record_update = @record.update(
           order_status: true
      )
       
       if record_update.save!
         respond_to do |format|
           format.html { redirect_to find_patient_details_path(:chosen => @patient_id, :doc =>  @doctor_id ), notice: 'Patient med record was successfully created.' }
         end
       end
      
    end
    
    
    
  end
  
  

  # POST /patient_med_records
  # POST /patient_med_records.json
  def create
   @patient_med_record = PatientMedRecord.new(patient_med_record_params)
    @doctor_id = patient_med_record_params[:doctor_id] 
    @patient_id =patient_med_record_params[:patient_id]
    @confirmed_appt_id = patient_med_record_params[:confirmed_appt_id]
    @patient_name = PersonInfo.where(id: @patient_id)[0]
    
    @confirmed_appt = ConfirmedAppointment.find(@confirmed_appt_id)
    @appointment_type_id = @confirmed_appt.pre_appointment.appointment_type_id
       
    logger.info "Appt type #{@appointment_type_id.inspect}"
    respond_to do |format|
     if @appointment_type_id == "PDDP"
            
     else
        if @patient_med_record.save
        @confirmed_appt_id = patient_med_record_params[:confirmed_appt_id]
        @patient_id = patient_med_record_params[:patient_id]
        @doctor_id = patient_med_record_params[:doctor_id]
        confirmed_appt = ConfirmedAppointment.where(id: @confirmed_appt_id)[0]
        
        logger.info "Confirmed appt is #{confirmed_appt.inspect}"
         confirmed_appt.update_attribute(
            'attended_to', true
          )
       
          format.html { redirect_to find_patient_details_path(:chosen => @patient_id, :doc =>  @doctor_id ), notice: 'Patient med record was successfully created.' }
          format.json { render :show, status: :created, location: @patient_med_record }
  
      else
        format.html { render :new }
        format.json { render json: @patient_med_record.errors, status: :unprocessable_entity }
      end    
     end

    end
  end 
  
  # PATCH/PUT /patient_med_records/1
  # PATCH/PUT /patient_med_records/1.json
  def update
    respond_to do |format|
      if @patient_med_record.update(patient_med_record_params)
        format.html { redirect_to @patient_med_record, notice: 'Patient med record was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient_med_record }
      else
        format.html { render :edit }
        format.json { render json: @patient_med_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_med_records/1
  # DELETE /patient_med_records/1.json
  def destroy
    @patient_med_record.destroy
    respond_to do |format|
      format.html { redirect_to patient_med_records_url, notice: 'Patient med record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_med_record
      @patient_med_record = PatientMedRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_med_record_params
      params.require(:patient_med_record).permit(:confirmed_appt_id, :patient_id, :doctor_id, :clinical_complaints, :clinical_examinations, :working_diagnosis, :investigation_rquired, :treatments, :follow_up_plan, :active_status, :del_status, :order_status, medicine: [], dosage: [], frequency: [], no_of_days: [])
    end
end
