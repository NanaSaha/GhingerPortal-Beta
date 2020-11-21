class ServiceProvTypesController < ApplicationController
  before_action :set_service_prov_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  # GET /service_prov_types
  # GET /service_prov_types.json
  def index
    @service_masters = ServiceMaster.all.paginate(:page => params[:page], :per_page => 5).order('id desc')
    @service_prov_types = ServiceProvType.all.paginate(:page => params[:page], :per_page => 5).order('id desc')
    @provider_masters = ProviderMaster.joins(:service_prov_type).where(service_prov_types: {service_prov_type_title: "Hospital"}).paginate(:page => params[:page], :per_page => 5).order('id desc')
    @provider_services = ProviderService.all
    
      #search
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
      @per_page = params[:per_page] || ServiceProvType.per_page || 5
      @service_prov_types  = ServiceProvType.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 5
   end
   @per_page = params[:per_page] || ServiceProvType.per_page || 5
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
      format.csv { send_data @service_prov_types.to_csv(options = {}, page, perpage)}
      format.xls { send_data @service_prov_types.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    
  end

  # GET /service_prov_types/1
  # GET /service_prov_types/1.json
  def show
    @service_prov_types = ServiceProvType.all.paginate(:page => params[:page], :per_page => 5).order('id desc')
  end

  # GET /service_prov_types/new
  def new
    @service_prov_type = ServiceProvType.new
  end

  # GET /service_prov_types/1/edit
  def edit
  end 
  
  def all_service_prov_type_excel
    @service_prov_types = ServiceProvType.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @service_prov_types.to_csv }
      format.xls { send_data @service_prov_types.to_csv(options={col_sep: "\t"}) }
    end
    
  end
  
  def enable_prov_type
      type_id=params[:chosen]
      type = ServiceProvType.find(type_id)
     if type.update(:active_status => 1)
       redirect_to service_prov_types_path, notice: 'Provider type was successfully enabled.'
     end
  end

  def disable_prov_type
      type_id=params[:chosen]
      
      type = ServiceProvType.find(type_id)
      # logger.info "country is: #{country.inspect}"
      
     if type.update(:active_status => 0)
       redirect_to service_prov_types_path, notice: 'Provider type was successfully disabled.'
     end
         
  end
  
  # def find_prov_type
    # prov_types = ServiceProvType.find(params[:prov_type_id ])
#     
    # @provider_masters = ProviderMaster.where(provider_type_id: prov_types.id)
#      
    # @Prov_type = prov_types.service_prov_type_title
#     
    # @current_prov_type_id = prov_types.id
#     
    # logger.info "Provider type is: #{ @Prov_type.inspect}"
    # logger.info "Provider type id  is: #{ @current_prov_type_id.inspect}"
  # end
  
  

  # POST /service_prov_types
  # POST /service_prov_types.json
  def create
    @service_prov_type = ServiceProvType.new(service_prov_type_params)

    respond_to do |format|
      if @service_prov_type.save 
        @service_prov_types = ServiceProvType.all.paginate(:page => params[:page], :per_page => 5).order('id desc')
        # render :js => "window.location = '/service_prov_types/'"
        format.js { flash.now[:notice] = "Provider type was successfully created." }
        format.html { redirect_to @service_prov_type, notice: 'Service prov type was successfully created.' }
        format.json { render :show, status: :created, location: @service_prov_type }
      else
        format.js { render :new }
        format.html { render :new }
        format.json { render json: @service_prov_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_prov_types/1
  # PATCH/PUT /service_prov_types/1.json
  def update
    respond_to do |format|
      if @service_prov_type.update(service_prov_type_params)
        @service_prov_types = ServiceProvType.all.paginate(:page => params[:page], :per_page => 5).order('id desc')
        format.js { flash.now[:notice] = "Provider type was successfully updated." }
        format.html { redirect_to @service_prov_type, notice: 'Service prov type was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_prov_type }
      else
        format.js { render :edit }
        format.html { render :edit }
        format.json { render json: @service_prov_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_prov_types/1
  # DELETE /service_prov_types/1.json
  def destroy
    @service_prov_type.destroy
    respond_to do |format|
      format.html { redirect_to service_prov_types_url, notice: 'Service prov type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_prov_type
      @service_prov_type = ServiceProvType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_prov_type_params
      params.require(:service_prov_type).permit(:service_prov_type_title, :comment, :entity_id, :user_id, :active_status, :change_status)
    end
end
