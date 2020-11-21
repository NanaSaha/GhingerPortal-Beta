class ProviderServicesController < ApplicationController
  before_action :set_provider_service, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  
  # GET /provider_services
  # GET /provider_services.json
  def index
    @provider_services = ProviderService.all
    # @provider_masters = ProviderMaster.all
     @service_masters = ServiceMaster.all
  end

  # GET /provider_services/1
  # GET /provider_services/1.json
  def show
  end

  # GET /provider_services/new
  def new
    providers = ProviderMaster.find(params[:provider_id])
    @current_prov_id = params[:provider_id]
    @provider = providers.provider_name
   
   
    @provider_service = ProviderService.new
    # @provider_masters = ProviderMaster.all
    @service_masters = ServiceMaster.all
  end

  # GET /provider_services/1/edit
  def edit
    @provider_masters = ProviderMaster.all
    @service_masters = ServiceMaster.all
  end
  
  
  def enable_provider_service
      prov_service_id=params[:chosen]
      prov_service = ProviderService.find(prov_service_id)
     if prov_service.update(:active_status => 1)
       redirect_to provider_services_path, notice: 'Provider Service was successfully enabled.'
     end
  end

  def disable_provider_service
      prov_service_id=params[:chosen]
      
      prov_service = ProviderService.find(prov_service_id)
      # logger.info "country is: #{country.inspect}"
      
     if prov_service.update(:active_status => 0)
       redirect_to provider_services_path, notice: 'Provider Service was successfully disabled.'
     end
     
  end
  
  def find_services
     provider = ProviderMaster.find(params[:provider_id])
     @current_prov_id = provider.id
     @provider = provider.provider_name
     
     @provider_services = ProviderService.where(service_provider_id: @current_prov_id)
       
     @service_masters = ServiceMaster.joins(:provider_services).where(["service_masters.id = ? ", :service_id])
     
     logger.info "provider id is #{@current_prov_id}"
     logger.info "provider name is #{@provider}"
      logger.info "provider name is #{@ser_id}"
  end
 
  # POST /provider_services
  # POST /provider_services.json
  def create
    @provider_service = ProviderService.new(provider_service_params)
    

    respond_to do |format|
      if @provider_service.save
        format.js { flash.now[:notice] = "Provider Service was successfully created." }
        format.html { redirect_to @provider_service, notice: 'Provider service was successfully created.' }
        format.json { render :show, status: :created, location: @provider_service }
      else
        @provider_masters = ProviderMaster.all
        @service_masters = ServiceMaster.all
        format.js { render :new }
        format.html { render :new }
        format.json { render json: @provider_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provider_services/1
  # PATCH/PUT /provider_services/1.json
  def update
    respond_to do |format|
      if @provider_service.update(provider_service_params)
        format.js { flash.now[:notice] = "Provider Service was successfully updated." }
        format.html { redirect_to @provider_service, notice: 'Provider service was successfully updated.' }
        format.json { render :show, status: :ok, location: @provider_service }
      else
        format.js { render :edit }
        format.html { render :edit }
        format.json { render json: @provider_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provider_services/1
  # DELETE /provider_services/1.json
  def destroy
    @provider_service.destroy
    respond_to do |format|
      format.html { redirect_to provider_services_url, notice: 'Provider service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider_service
      @provider_service = ProviderService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_service_params
      params.require(:provider_service).permit(:service_provider_id, :service_id, :comment, :entity_id, :user_id, :active_status, :change_status)
    end
end
