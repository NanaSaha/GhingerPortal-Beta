class AppointmentTypesController < ApplicationController
  before_action :set_appointment_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
#  load_and_authorize_resource
  # before_action :authenticate_user!
 # before_filter :load_permissions

  # GET /appointment_types
  # GET /appointment_types.json
  def index
    @appointment_types = AppointmentType.all.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
    @pre_appointments = PreAppointment.where(confirm_status: false,  pre_confirm_status: false).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
    @provider_masters = ProviderMaster.all.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
    @confirmed_appointments = ConfirmedAppointment.all.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
    @confirmed_personal_doctor_services = ConfirmedPersonalDoctorService.all.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
    # @pre_confirmed_appointments = PreConfirmedAppointment.all.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
    @pre_confirmed_appointments = PreConfirmedAppointment.select('DISTINCT ON ("pre_appointment_id") *').paginate(:page => params[:page], :per_page => 10).order('pre_appointment_id desc', 'created_at desc')

    @all_billings = PatientBillingInfo.joins(:billing_info_bill_items)
                    .where("patient_billing_infos.active_status is true and patient_billing_infos.del_status is false").distinct
                    .paginate(:page => params[:page], :per_page => 30).order('patient_billing_infos.created_at desc')
    
    logger.info "############################################"
    logger.info "Here is the pre confirmed appointments #{@pre_confirmed_appointments.inspect}"
    logger.info "############################################"
    # @person_info = PersonInfo.joins(:registration).where("registration.id = person_infos.reg_id")[0]
    # logger.info "person joints #{@person_info.inspect}"
    
    if params[:count]
      params[:count]
   else
     params[:count] = 5
   end
   
   if params[:page]
     page = params[:page].to_i
   else
     page = 1
   end
   
   if params[:per_page].present?
      # perpage = params[:per_page]
      @per_page = params[:per_page] || AppointmentType.per_page || 5
      @appointment_types = AppointmentType.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 5
   end
   @per_page = params[:per_page] || AppointmentType.per_page || 5
   page = if params[:page]
            params[:page].to_i
           else
            1
           end
   

         
# Filter by appointment type
if params[:title]
   @type = params[:title]  
   logger.info "Then part is #{@type.inspect}"
   @appointment_types = AppointmentType.where(title: @type).paginate( :page => params[:page], :per_page => 5).order('id desc')   
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
      # format.csv { send_data @contacts.to_csv}
    end
    
    
    
  end

  # GET /appointment_types/1
  # GET /appointment_types/1.json
  def show
  end

  # GET /appointment_types/new
  def new
    @appointment_type = AppointmentType.new
  end

  # GET /appointment_types/1/edit
  def edit
  end

 
  def enable_appointment_type
      appointment_id=params[:chosen]
      type = AppointmentType.find(appointment_id)
     if type.update(:active_status => 1)
       redirect_to appointment_types_path, notice: 'Appointment type was successfully enabled.'
     end
  end
 
  def disable_appointment_type
      appointment_id=params[:chosen]
      
      type = AppointmentType.find(appointment_id)
      
     if type.update(:active_status => 0)
       redirect_to appointment_types_path, notice: 'Appointment type was successfully disabled.'
     end    
  end


  # POST /appointment_types
  # POST /appointment_types.json
  def create
    @appointment_type = AppointmentType.new(appointment_type_params)

    respond_to do |format|
      if @appointment_type.save
        format.js { flash.now[:notice] = "Appointment type was successfully created." }
        format.html { redirect_to @appointment_type, notice: 'Appointment type was successfully created.' }
        format.json { render :show, status: :created, location: @appointment_type }
      else
        format.js { render :new}
        format.html { render :new }
        format.json { render json: @appointment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointment_types/1
  # PATCH/PUT /appointment_types/1.json
  def update
    respond_to do |format|
      if @appointment_type.update(appointment_type_params)
        format.js { flash.now[:notice] = "Appointment type was successfully updated." }
        format.html { redirect_to @appointment_type, notice: 'Appointment type was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment_type }
      else
        format.html { render :edit }
        format.json { render json: @appointment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointment_types/1
  # DELETE /appointment_types/1.json
  def destroy
    @appointment_type.destroy
    respond_to do |format|
      format.html { redirect_to appointment_types_url, notice: 'Appointment type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment_type
      @appointment_type = AppointmentType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_type_params
      params.require(:appointment_type).permit(:title, :comment, :user_id, :entity_id, :active_status, :del_status)
    end
end
