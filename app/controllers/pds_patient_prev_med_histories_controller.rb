class PdsPatientPrevMedHistoriesController < ApplicationController
  before_action :set_pds_patient_prev_med_history, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions

  # GET /pds_patient_prev_med_histories
  # GET /pds_patient_prev_med_histories.json
  def index
    @pds_patient_prev_med_histories = PdsPatientPrevMedHistory.all
  end

  # GET /pds_patient_prev_med_histories/1
  # GET /pds_patient_prev_med_histories/1.json
  def show
  end

  # GET /pds_patient_prev_med_histories/new
  def new
    @pds_patient_prev_med_history = PdsPatientPrevMedHistory.new
  end

  # GET /pds_patient_prev_med_histories/1/edit
  def edit
  end

  # POST /pds_patient_prev_med_histories
  # POST /pds_patient_prev_med_histories.json
  def create
    @pds_patient_prev_med_history = PdsPatientPrevMedHistory.new(pds_patient_prev_med_history_params)

    respond_to do |format|
      if @pds_patient_prev_med_history.save
        format.html { redirect_to @pds_patient_prev_med_history, notice: 'Pds patient prev med history was successfully created.' }
        format.json { render :show, status: :created, location: @pds_patient_prev_med_history }
      else
        format.html { render :new }
        format.json { render json: @pds_patient_prev_med_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pds_patient_prev_med_histories/1
  # PATCH/PUT /pds_patient_prev_med_histories/1.json
  def update
    respond_to do |format|
      if @pds_patient_prev_med_history.update(pds_patient_prev_med_history_params)
        format.html { redirect_to @pds_patient_prev_med_history, notice: 'Pds patient prev med history was successfully updated.' }
        format.json { render :show, status: :ok, location: @pds_patient_prev_med_history }
      else
        format.html { render :edit }
        format.json { render json: @pds_patient_prev_med_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pds_patient_prev_med_histories/1
  # DELETE /pds_patient_prev_med_histories/1.json
  def destroy
    @pds_patient_prev_med_history.destroy
    respond_to do |format|
      format.html { redirect_to pds_patient_prev_med_histories_url, notice: 'Pds patient prev med history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pds_patient_prev_med_history
      @pds_patient_prev_med_history = PdsPatientPrevMedHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pds_patient_prev_med_history_params
      params.require(:pds_patient_prev_med_history).permit(:confirmed_pds_id, :prev_med_histry, :user_id, :active_status, :del_status)
    end
end
