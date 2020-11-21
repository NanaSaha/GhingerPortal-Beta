class LabDetailsController < ApplicationController
  before_action :set_lab_detail, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  # GET /lab_details
  # GET /lab_details.json
  def index
    @lab_details = LabDetail.all
  end

  # GET /lab_details/1
  # GET /lab_details/1.json
  def show
  end

  # GET /lab_details/new
  def new
    @lab_detail = LabDetail.new
  end

  # GET /lab_details/1/edit
  def edit
  end
  
  def find_lab_details
    # @pre_appointment_id = params[:pre_appointment_id]
    @confirmed_appt_id = params[:confirmed_appt_id]
    @lab_details = LabDetail.joins("left join service_fee_masters on lab_details.lab_service_id = service_fee_masters.service_id")
                   .where("lab_details.confirmed_appt_id =? and lab_details.del_status =? and lab_details.active_status =? and
                  service_fee_masters.active_status =? and service_fee_masters.del_status =?", @confirmed_appt_id, false, true, true, false)
    @lab_services = LabService.all
    
    logger.info "lab details is #{@lab_details.inspect}"
    @lab_detail =LabDetail.where(confirmed_appt_id: @confirmed_appt_id, del_status: false, active_status: true)[0]
    
    if @lab_detail.nil?
      flash.now[:notice] = "There are no lab details for this appointment at the moment."
    end
     
     
  end

  # POST /lab_details
  # POST /lab_details.json
  def create
    @lab_detail = LabDetail.new(lab_detail_params)

    respond_to do |format|
      if @lab_detail.save
        format.html { redirect_to @lab_detail, notice: 'Lab detail was successfully created.' }
        format.json { render :show, status: :created, location: @lab_detail }
      else
        format.html { render :new }
        format.json { render json: @lab_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lab_details/1
  # PATCH/PUT /lab_details/1.json
  def update
    respond_to do |format|
      if @lab_detail.update(lab_detail_params)
        format.html { redirect_to @lab_detail, notice: 'Lab detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @lab_detail }
      else
        format.html { render :edit }
        format.json { render json: @lab_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lab_details/1
  # DELETE /lab_details/1.json
  def destroy
    @lab_detail.destroy
    respond_to do |format|
      format.html { redirect_to lab_details_url, notice: 'Lab detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab_detail
      @lab_detail = LabDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lab_detail_params
      params.require(:lab_detail).permit(:pre_appointment_id, :lab_service_id, :comment, :user_id, :active_status, :del_status)
    end
end
