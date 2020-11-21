class ProviderMastersController < ApplicationController
  before_action :set_provider_master, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  # GET /provider_masters
  # GET /provider_masters.json
  def index
    @provider_masters = ProviderMaster.joins(:service_prov_type).where(service_prov_types: {service_prov_type_title: "Hospital"}).paginate(:page => params[:page], :per_page => 10).order('id desc')
    @service_prov_types = ServiceProvType.all
    @service_prov_extra_infos = ServiceProvExtraInfo.all
    
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
      @per_page = params[:per_page] || ProviderMaster.per_page || 10
      @provider_masters = ProviderMaster.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || ProviderMaster.per_page || 10
   page = if params[:page]
            params[:page].to_i
           else
            1
           end
   
         
# Filter by provider type
if params[:service_prov_type_title]
   @provider_type = params[:service_prov_type_title]
   logger.info "The provider type  is #{@provider_type.inspect}"
   @provider_masters = ProviderMaster.joins(:service_prov_type).where(service_prov_types: {service_prov_type_title: @provider_type}).paginate( :page => params[:page], :per_page => 5).order('id desc')  
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
      format.csv { send_data @provider_masters.to_csv(options = {}, page, perpage)}
      format.xls { send_data @provider_masters.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    
  end
  
  def all_provider_excel
    @provider_masters = ProviderMaster.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @provider_masters.to_csv }
      format.xls { send_data @provider_masters.to_csv(options={col_sep: "\t"}) }
    end
    
  end

  # GET /provider_masters/1
  # GET /provider_masters/1.json
  def show
    service_prov_extra_info = ServiceProvExtraInfo.where(service_prov_id: params[:prov_type_id])[0]
  end
  
  def provider_details 
    @suburb_masters = SuburbMaster.all
    @provider_id = params[:provider_id]
    @provider_master = ProviderMaster.where("id = #{@provider_id}")[0]
    @service_prov_extra_info = ServiceProvExtraInfo.where("service_prov_id = #{@provider_id}")[0]
    @suburb_master = SuburbMaster.where(:id => @service_prov_extra_info.suburb_id)[0]
    logger.info "Suburb is selcted:  #{@suburb_master.inspect}"
    
    @suburb_name = @service_prov_extra_info.suburb_master.suburb_name
    @contact1 = @service_prov_extra_info.contact_number1
    @contact2 = @service_prov_extra_info.contact_number2
    @postal_address = @service_prov_extra_info.postal_address
    @location_address = @service_prov_extra_info.location_address
    @contact_person = @service_prov_extra_info.contact_person_name
    @web = @service_prov_extra_info.web_url
    @latitude = @service_prov_extra_info.latitude
    @longitude = @service_prov_extra_info.longitude
    
    @provider_type_id = @provider_master.service_prov_type.id
    logger.info "C1:  #{@contact1.inspect}"
    
  end

  # GET /provider_masters/new
  def new
    # prov_types = ServiceProvType.find(params[:prov_type_id ])
    @service_prov_extra_infos = ServiceProvExtraInfo.all
    
    # @current_prov_type_id = prov_types.id
    # @Prov_type = prov_types.service_prov_type_title
    
    @provider_master = ProviderMaster.new
    # @service_prov_types = ServiceProvType.all
    @provider_master.service_prov_extra_infos.build
    # @service_prov_extra_infos = ServiceProvExtraInfo.all
    
  end

  # GET /provider_masters/1/edit
  def edit
    @service_prov_types = ServiceProvType.all
    @service_prov_extra_infos = ServiceProvExtraInfo.all
  end
  
  def enable_service_provider
      provider_id=params[:chosen]
      provider = ProviderMaster.find(provider_id)
     if provider.update(:active_status => 1)
       redirect_to provider_masters_path, notice: 'Service Provider was successfully enabled.'
     end
  end

  def disable_service_provider
      provider_id=params[:chosen]
      
      provider = ProviderMaster.find(provider_id)
      # logger.info "country is: #{country.inspect}"
      
     if provider.update(:active_status => 0)
       redirect_to provider_masters_path, notice: 'Service Provider was successfully disabled.'
     end
     
  end
  
  
  def find_prov_type
    prov_types = ServiceProvType.find(params[:prov_type_id ])
    
    @provider_masters = ProviderMaster.where(provider_type_id: prov_types.id).paginate(:page => params[:page], :per_page => 5).order('id desc')
     
    @Prov_type = prov_types.service_prov_type_title
    
    @current_prov_type_id = prov_types.id
    
    logger.info "Provider master is: #{ @provider_masters.inspect}"
    logger.info "Provider type id  is: #{ @current_prov_type_id.inspect}"
  end
  

  def find_extra_info
    @suburb_master = SuburbMaster.all
    provider_id = params[:provider_id]
    @service_prov_extra_info = ServiceProvExtraInfo.joins(:provider_master, :suburb_master).where("service_prov_extra_infos.suburb_id = suburb_masters.id and service_prov_extra_infos.service_prov_id = #{provider_id}" )[0]
    
    logger.info "Query is #{@service_prov_extra_info.inspect}"
  end
  

  # POST /provider_masters
  # POST /provider_masters.json
  def create
    @provider_master = ProviderMaster.new(provider_master_params)
    respond_to do |format|
      if @provider_master.save
        @provider_masters = ProviderMaster.all.paginate(:page => params[:page], :per_page => 5).order('id desc')
        format.js { flash.now[:notice] = "Service Provider was successfully created." }
        format.html { redirect_to @provider_master, notice: 'Provider master was successfully created.' }
        format.json { render :show, status: :created, location: @provider_master }
      else
        @service_prov_types = ServiceProvType.all
        format.js { render :new}
        format.html { render :new }
        format.json { render json: @provider_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provider_masters/1
  # PATCH/PUT /provider_masters/1.json
  def update
    respond_to do |format|
      if @provider_master.update(provider_master_params)
        @provider_masters = ProviderMaster.all.paginate(:page => params[:page], :per_page => 5).order('id desc')
        format.js { flash.now[:notice] = "Service Provider was successfully updated." }
        format.html { redirect_to @provider_master, notice: 'Provider master was successfully updated.' }
        format.json { render :show, status: :ok, location: @provider_master }
      else
        @service_prov_types = ServiceProvType.all
        format.js {render :edit}
        format.html { render :edit }
        format.html { render :edit }
        format.json { render json: @provider_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provider_masters/1
  # DELETE /provider_masters/1.json
  def destroy
    @provider_master.destroy
    respond_to do |format|
      format.html { redirect_to provider_masters_url, notice: 'Provider master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider_master
      @provider_master = ProviderMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_master_params
      params.require(:provider_master).permit(:provider_name, :alias, :provider_type_id, :comment, :entity_id, :user_id, :active_status, :change_status, service_prov_extra_infos_attributes: [ :id, :service_prov_id, :suburb_id, :contact_number1, :contact_number2, :postal_address, :location_address, :contact_person_name, :web_url, :longitude, :latitude, :comment, :entity_id, :user_id, :active_status, :del_status, :_destroy ] )
    end
end
