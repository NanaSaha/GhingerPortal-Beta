class ServiceMastersController < ApplicationController
  before_action :set_service_master, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  # GET /service_masters
  # GET /service_masters.json
  def index
    @service_masters = ServiceMaster.all.paginate(:page => params[:page], :per_page => 5).order('id desc')
  
  
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
      @per_page = params[:per_page] || ServiceMaster.per_page || 5
      @service_masters = ServiceMaster.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 5
   end
   @per_page = params[:per_page] || ServiceMaster.per_page || 5
   page = if params[:page]
            params[:page].to_i
           else
            1
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
      format.csv { send_data @service_masters.to_csv(options = {}, page, perpage)}
      format.xls { send_data @service_masters.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    
  end

  # GET /service_masters/1
  # GET /service_masters/1.json
  def show
  end

  # GET /service_masters/new
  def new
    @service_master = ServiceMaster.new
  end

  # GET /service_masters/1/edit
  def edit
  end
    
  
  def all_service_excel
    @service_masters = ServiceMaster.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @service_masters.to_csv }
      format.xls { send_data @service_masters.to_csv(options={col_sep: "\t"}) }
    end
    
  end
   
  def enable_service
      service_id=params[:chosen]
      service = ServiceMaster.find(service_id)
     if service.update(:active_status => 1)
       redirect_to service_masters_path, notice: 'Service was successfully enabled.'
     end
  end

  def disable_service
      service_id=params[:chosen]
      
      service = ServiceMaster.find(service_id)
      # logger.info "country is: #{country.inspect}"
      
     if service.update(:active_status => 0)
       redirect_to service_masters_path, notice: 'Service was successfully disabled.'
     end
     
  end
  
  def service_details
    @service_id = params[:service_id]
    @service_master = ServiceMaster.find(@service_id)
    logger.info "Service is : #{@service_master.inspect}"
    @provider_id = params[:provider_id]
    logger.info "Provider id is #{@provider_id.inspect}"
  end
  
  

  # POST /service_masters
  # POST /service_masters.json
  def create
    @service_master = ServiceMaster.new(service_master_params)

    respond_to do |format|
      if @service_master.save
        format.js { flash.now[:notice] = "Service was successfully created." }
        format.html { redirect_to @service_master, notice: 'Service master was successfully created.' }
        format.json { render :show, status: :created, location: @service_master }
      else
        format.js { render :new }
        format.html { render :new }
        format.json { render json: @service_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_masters/1
  # PATCH/PUT /service_masters/1.json
  def update
    respond_to do |format|
      if @service_master.update(service_master_params)
        format.js { flash.now[:notice] = "Service was successfully updated." }
        format.html { redirect_to @service_master, notice: 'Service master was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_master }
      else
        format.js { render :edit}
        format.html { render :edit }
        format.json { render json: @service_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_masters/1
  # DELETE /service_masters/1.json
  def destroy
    @service_master.destroy
    respond_to do |format|
      format.html { redirect_to service_masters_url, notice: 'Service master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_master
      @service_master = ServiceMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_master_params
      params.require(:service_master).permit(:title, :comment, :entity_id, :user_id, :active_status, :change_status)
    end
end
