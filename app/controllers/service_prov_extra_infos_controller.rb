class ServiceProvExtraInfosController < ApplicationController
  before_action :set_service_prov_extra_info, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  # GET /service_prov_extra_infos
  # GET /service_prov_extra_infos.json
  def index
    @service_prov_extra_infos = ServiceProvExtraInfo.all
    @provider_masters = ProviderMaster.all
  end

  # GET /service_prov_extra_infos/1
  # GET /service_prov_extra_infos/1.json
  def show  
    @provider_id = params[:provider_id]
     @provider_masters = ProviderMaster.all
     @service_prov_extra_infos = ServiceProvExtraInfo.where(service_prov_id: @provider_id)
    # @provider_masters = ProviderMaster.find params[:id]
  end

  # GET /service_prov_extra_infos/new
  def new
    @provider_masters = ProviderMaster.all
    
    # @service_prov_extra_info = @provider_masters.set_service_prov_extra_infos.build
  end

  # GET /service_prov_extra_infos/1/edit
  def edit
  end
  
  def find_extra_info
    @suburb_master = SuburbMaster.all
    @provider_id = params[:provider_id]
    @service_prov_extra_info = ServiceProvExtraInfo.joins(:provider_master, :suburb_master).where("service_prov_extra_infos.suburb_id = suburb_masters.id and service_prov_extra_infos.service_prov_id = #{@provider_id}")[0]
    
    logger.info "SQL is #{@service_prov_extra_info.inspect}"
  end
  helper_method :find_extra_info

  # POST /service_prov_extra_infos
  # POST /service_prov_extra_infos.json
  def create
    @service_prov_extra_info = ServiceProvExtraInfo.new(service_prov_extra_info_params)

    respond_to do |format|
      if @service_prov_extra_info.save
        format.js 
        format.html { redirect_to @service_prov_extra_info, notice: 'Service prov extra info was successfully created.' }
        format.json { render :show, status: :created, location: @service_prov_extra_info }
      else
        @provider_masters = ProviderMaster.all
        format.html { render :new }
        format.json { render json: @service_prov_extra_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_prov_extra_infos/1
  # PATCH/PUT /service_prov_extra_infos/1.json
  def update
    respond_to do |format|
      if @service_prov_extra_info.update(service_prov_extra_info_params)
        format.html { redirect_to @service_prov_extra_info, notice: 'Service prov extra info was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_prov_extra_info }
      else
        @provider_masters = ProviderMaster.all
        format.html { render :edit }
        format.json { render json: @service_prov_extra_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_prov_extra_infos/1
  # DELETE /service_prov_extra_infos/1.json
  def destroy
    @service_prov_extra_info.destroy
    respond_to do |format|
      format.html { redirect_to service_prov_extra_infos_url, notice: 'Service prov extra info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_prov_extra_info
      @service_prov_extra_info = ServiceProvExtraInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_prov_extra_info_params
      params.require(:service_prov_extra_info).permit(:service_prov_id, :suburb_id, :contact_number1, :contact_number2, :postal_address, :location_address, :contact_person_name, :web_url, :longitude, :latitude, :comment, :entity_id, :user_id, :active_status, :del_status)
    end
end
