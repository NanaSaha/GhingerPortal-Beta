class MedicationDetailsController < ApplicationController
  before_action :set_medication_detail, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  # load_and_authorize_resource
  # before_filter :load_permissions

  # GET /medication_details
  # GET /medication_details.json
  def index
    @medication_details = MedicationDetail.all
  end

  # GET /medication_details/1
  # GET /medication_details/1.json
  def show
  end

  # GET /medication_details/new
  def new
    @medication_detail = MedicationDetail.new
  end

  def find_med_details
    @confirmed_appt_id = params[:confirmed_appt_id]
    @med_details = MedicationDetail.joins("left join drug_prices on medication_details.drug_id = drug_prices.drug_id")
                        .where("medication_details.confirmed_appt_id =? and medication_details.del_status =? and medication_details.active_status =? and
                        drug_prices.active_status =? and drug_prices.del_status =?", @confirmed_appt_id, false, true, true, false)
    @med_services = MedicationDetail.all

    logger.info "med details is #{@med_details.inspect}"
    @med_detail =MedicationDetail.where(confirmed_appt_id: @confirmed_appt_id, del_status: false, active_status: true)[0]

    if @med_detail.nil?
      flash.now[:notice] = "There are no medication for this appointment at the moment."
    end
  end

  # GET /medication_details/1/edit
  def edit
  end

  # POST /medication_details
  # POST /medication_details.json
  def create
    @medication_detail = MedicationDetail.new(medication_detail_params)

    respond_to do |format|
      if @medication_detail.save
        format.html { redirect_to @medication_detail, notice: 'Medication detail was successfully created.' }
        format.json { render :show, status: :created, location: @medication_detail }
      else
        format.html { render :new }
        format.json { render json: @medication_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medication_details/1
  # PATCH/PUT /medication_details/1.json
  def update
    respond_to do |format|
      if @medication_detail.update(medication_detail_params)
        format.html { redirect_to @medication_detail, notice: 'Medication detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @medication_detail }
      else
        format.html { render :edit }
        format.json { render json: @medication_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medication_details/1
  # DELETE /medication_details/1.json
  def destroy
    @medication_detail.destroy
    respond_to do |format|
      format.html { redirect_to medication_details_url, notice: 'Medication detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medication_detail
      @medication_detail = MedicationDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medication_detail_params
      params.require(:medication_detail).permit(:confirmed_appt_id, :drug_id, :comment, :user_id, :active_status, :del_status)
    end
end
