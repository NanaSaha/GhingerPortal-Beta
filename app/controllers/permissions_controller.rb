class PermissionsController < ApplicationController
  before_action :set_permission, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  # GET /permissions
  # GET /permissions.json
  def index
    @permissions = Permission.all.paginate(:page => params[:page], :per_page => 10).order('id desc')
    
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
      @per_page = params[:per_page] || Permission.per_page || 10
      @permissions = Permission.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || Permission.per_page || 10
   page = if params[:page]
            params[:page].to_i
           else
            1 
           end
   

         
# Filter 
if params[:provider_name]
  @provider_name = params[:provider_name]  
  logger.info "The provider is #{@provider_name.inspect}"
  @pre_appointments = Permission.joins(:provider_master).where(provider_masters: {provider_name: @provider_name}).paginate( :page => params[:page], :per_page => 10).order('id desc')   

elsif params[:category]
  @category = params[:category]
  logger.info "The category is #{@category.inspect}"
  @pre_appointments = Permission.joins(:request_category).where(request_categories: {category: @category}).paginate( :page => params[:page], :per_page => 10).order('id desc')

elsif params[:title]
  @type = params[:title]
  logger.info "The type is #{@type.inspect}"
  @pre_appointments = Permission.joins(:appointment_type).where(appointment_types: {title: @type}).paginate( :page => params[:page], :per_page => 10).order('id desc')

end 


   
#            
   # per_page = 5
#    
   # offset = (page - 1) * per_page
   # limit = page * per_page
   # @array = *(offset...limit)


  if  params[:search_value] && params[:search_value].strip != ''
         
         if params[:search_param] == 'subject_class'
           logger.info "the code comes to if  doctor............"
           @permissions = Permission.subject_class_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('id asc')
           
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
      format.csv { send_data @permissions.to_csv(options = {}, page, perpage)}
      format.xls { send_data @permissios.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    
    
  end
  
  def all_permission_excel
    @permissions = Permission.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @permissions.to_csv }
      format.xls { send_data @permissions.to_csv(options={col_sep: "\t"}) }
    end
  end


  # GET /permissions/1
  # GET /permissions/1.json
  def show
  end

  # GET /permissions/new
  def new
    @permission = Permission.new
  end

  # GET /permissions/1/edit
  def edit
  end

  # POST /permissions
  # POST /permissions.json
  def create
    @permission = Permission.new(permission_params)

    respond_to do |format|
      if @permission.save
        format.html { redirect_to @permission, notice: 'Permission was successfully created.' }
        format.json { render :show, status: :created, location: @permission }
      else
        format.html { render :new }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permissions/1
  # PATCH/PUT /permissions/1.json
  def update
    respond_to do |format|
      if @permission.update(permission_params)
        format.html { redirect_to @permission, notice: 'Permission was successfully updated.' }
        format.json { render :show, status: :ok, location: @permission }
      else
        format.html { render :edit }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permissions/1
  # DELETE /permissions/1.json
  def destroy
    @permission.destroy
    respond_to do |format|
      format.html { redirect_to permissions_url, notice: 'Permission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permission
      @permission = Permission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permission_params
      params.require(:permission).permit(:subjuct_class, :action, :name, :description)
    end
end
