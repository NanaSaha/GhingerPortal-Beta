class ConfirmedConditionsController < ApplicationController
  before_action :set_confirmed_condition, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions

  # GET /confirmed_conditions
  # GET /confirmed_conditions.json
  def index
    @confirmed_conditions = ConfirmedCondition.all
  end

  # GET /confirmed_conditions/1
  # GET /confirmed_conditions/1.json
  def show
  end

  # GET /confirmed_conditions/new
  def new
    @confirmed_condition = ConfirmedCondition.new
  end

  # GET /confirmed_conditions/1/edit
  def edit
  end

  # POST /confirmed_conditions
  # POST /confirmed_conditions.json
  def create
    @confirmed_condition = ConfirmedCondition.new(confirmed_condition_params)

    respond_to do |format|
      if @confirmed_condition.save
        format.html { redirect_to @confirmed_condition, notice: 'Confirmed condition was successfully created.' }
        format.json { render :show, status: :created, location: @confirmed_condition }
      else
        format.html { render :new }
        format.json { render json: @confirmed_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /confirmed_conditions/1
  # PATCH/PUT /confirmed_conditions/1.json
  def update
    respond_to do |format|
      if @confirmed_condition.update(confirmed_condition_params)
        format.html { redirect_to @confirmed_condition, notice: 'Confirmed condition was successfully updated.' }
        format.json { render :show, status: :ok, location: @confirmed_condition }
      else
        format.html { render :edit }
        format.json { render json: @confirmed_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /confirmed_conditions/1
  # DELETE /confirmed_conditions/1.json
  def destroy
    @confirmed_condition.destroy
    respond_to do |format|
      format.html { redirect_to confirmed_conditions_url, notice: 'Confirmed condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_confirmed_condition
      @confirmed_condition = ConfirmedCondition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def confirmed_condition_params
      params.require(:confirmed_condition).permit(:confirmed_appointment_id, :condition_id, :allergy_id, :comment, :user_id, :entity, :active_status, :del_status)
    end
end
