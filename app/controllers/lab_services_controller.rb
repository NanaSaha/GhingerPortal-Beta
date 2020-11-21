class LabServicesController < ApplicationController
  before_action :set_lab_service, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  # GET /lab_services
  # GET /lab_services.json
  def index
    @lab_services = LabService.all.paginate(:page => params[:page], :per_page => 5).order('id desc')
    
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
      @per_page = params[:per_page] || LabService.per_page || 5
      @lab_services = LabService.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 5
   end
   @per_page = params[:per_page] || LabService.per_page || 5
   page = if params[:page]
            params[:page].to_i
           else
            1
           end
   

         
# Filter by human part
if params[:title]
   @lab = params[:title]
   logger.info "Then part is #{@lab.inspect}"
   @lab_services = LabService.where(title: @lab).paginate( :page => params[:page], :per_page => 5).order('id desc')   
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
      # format.js
      format.html
      format.csv { send_data @lab_services.to_csv(options = {}, page, perpage)}
      format.xls { send_data @lab_services.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
      
  end
  
  
  def all_lab_service_excel
    @lab_services = LabService.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @lab_services.to_csv }
      format.xls { send_data @lab_services.to_csv(options={col_sep: "\t"}) }
    end
  end

  # GET /lab_services/1
  # GET /lab_services/1.json
  def show
  end

  # GET /lab_services/new
  def new
    @lab_service = LabService.new
  end

  # GET /lab_services/1/edit
  def edit
  end

  # POST /lab_services
  # POST /lab_services.json
  def create
    @lab_service = LabService.new(lab_service_params)

    respond_to do |format|
      if @lab_service.save
        format.html { redirect_to @lab_service, notice: 'Lab service was successfully created.' }
        format.json { render :show, status: :created, location: @lab_service }
      else
        format.html { render :new }
        format.json { render json: @lab_service.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def enable_lab_service
      lab_id=params[:chosen]
      lab_service = LabService.find(lab_id)
     if lab_service.update(:active_status => 1)
       redirect_to lab_services_path, notice: 'Lab service was successfully enabled.'
     end
  end

  def disable_lab_service
      lab_id=params[:chosen]
      
      lab_service = LabService.find(lab_id)
      
     if lab_service.update(:active_status => 0)
       redirect_to lab_services_path, notice: 'Lab service was successfully disabled.'
     end    
  end
  
  
  
  

  # PATCH/PUT /lab_services/1
  # PATCH/PUT /lab_services/1.json
  def update
    respond_to do |format|
      if @lab_service.update(lab_service_params)
        format.html { redirect_to @lab_service, notice: 'Lab service was successfully updated.' }
        format.json { render :show, status: :ok, location: @lab_service }
      else
        format.html { render :edit }
        format.json { render json: @lab_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lab_services/1
  # DELETE /lab_services/1.json
  def destroy
    @lab_service.destroy
    respond_to do |format|
      format.html { redirect_to lab_services_url, notice: 'Lab service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab_service
      @lab_service = LabService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lab_service_params
      params.require(:lab_service).permit(:title, :price, :comment, :user_id, :active_status, :del_status)
    end
end
