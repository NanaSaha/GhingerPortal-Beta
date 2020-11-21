class ServiceFeeMastersController < ApplicationController
  before_action :set_service_fee_master, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  # load_and_authorize_resource
  # before_filter :load_permissions

  # GET /service_fee_masters
  # GET /service_fee_masters.json
  def index
    @ref_id = params[:ref_id]

    if @ref_id.present?
      @service_fee_masters = ServiceFeeMaster.where(appt_type_id: @ref_id).paginate(:page => params[:page], :per_page => 8).order('created_at desc')
    else
    @service_fee_masters = ServiceFeeMaster.all.paginate(:page => params[:page], :per_page => 8).order('created_at desc')
    end

    respond_to do |format|
      format.html
      format.csv { send_data @service_fee_masters.to_csv }
      format.xls { send_data @service_fee_masters.to_csv(options={col_sep: "\t"}) }
    end
  end

  def all_price_excel
    @service_fee_masters = ServiceFeeMaster.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      # format.js
      format.csv { send_data @service_fee_masters.to_csv }
      format.xls { send_data @service_fee_masters.to_csv(options={col_sep: "\t"}) }
    end
  end

  # GET /service_fee_masters/1
  # GET /service_fee_masters/1.json
  def show
  end

  def enable_price
    price_id = params[:chosen]
    price = ServiceFeeMaster.find(price_id)
    if price.update(:active_status => 1)
      redirect_to service_fee_masters_path, notice: 'Drug was successfully enabled.'
    end
  end

  def disable_price
    price_id=params[:chosen]
    price = ServiceFeeMaster.find(price_id)
    if price.update(:active_status => 0)
      redirect_to service_fee_masters_path, notice: 'Drug was successfully disabled.'
    end
  end

  # GET /service_fee_masters/new
  def new
    @service_fee_master = ServiceFeeMaster.new
    @lab_services = LabService.order(:title).where("title ilike ?", "%#{params[:service_id]}")

    @lab_list = @lab_services.map { |a|[a.title+" ",a.id]  }
  end

  # GET /service_fee_masters/1/edit
  def edit
    @lab_services = LabService.order(:title).where("title ilike ?", "%#{params[:service_id]}")

    @lab_list = @lab_services.map { |a|[a.title+" ",a.id]  }
  end

  # POST /service_fee_masters
  # POST /service_fee_masters.json
  def create
    @service_fee_master = ServiceFeeMaster.new(service_fee_master_params)

    @lab_services = LabService.order(:title).where("title ilike ?", "%#{params[:service_id]}")

    @lab_list = @lab_services.map { |a|[a.title+" ",a.id]  }

    respond_to do |format|
      if @service_fee_master.save
        format.js {flash[:notice] = "Service Price set successfully"}
        render js: "window.location='#{service_fee_masters_path}'"
        # format.html { redirect_to @service_fee_master, notice: 'Service fee master was successfully created.' }
        format.json { render :show, status: :created, location: @service_fee_master }
      else
        format.js {render :new }
        # format.html { render :new }
        format.json { render json: @service_fee_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_fee_masters/1
  # PATCH/PUT /service_fee_masters/1.json
  def update
    respond_to do |format|
      @lab_services = LabService.order(:title).where("title ilike ?", "%#{params[:service_id]}")

      @lab_list = @lab_services.map { |a|[a.title+" ",a.id]  }
      if @service_fee_master.update(service_fee_master_params)
        format.js {flash[:notice] = "Service Price updated successfully"}
        render js: "window.location='#{service_fee_masters_path}'"
        # format.html { redirect_to @service_fee_master, notice: 'Service fee master was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_fee_master }
      else
        format.js { render :edit }
        # format.html { render :edit }
        format.json { render json: @service_fee_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_fee_masters/1
  # DELETE /service_fee_masters/1.json
  def destroy
    @service_fee_master.destroy
    respond_to do |format|
      format.html { redirect_to service_fee_masters_url, notice: 'Service fee master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_fee_master
      @service_fee_master = ServiceFeeMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_fee_master_params
      params.require(:service_fee_master).permit(:appt_type_id, :service_id, :req_urgency, :fee, :fee, :comment, :user_id, :active_status, :del_status)
    end
end
