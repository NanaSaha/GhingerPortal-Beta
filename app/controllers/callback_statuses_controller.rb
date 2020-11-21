class CallbackStatusesController < ApplicationController
  before_action :set_callback_status, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
#  load_and_authorize_resource
 # before_filter :load_permissions
  # GET /callback_statuses
  # GET /callback_statuses.json
  def index
    @callback_statuses = CallbackStatus.all
  end

  # GET /callback_statuses/1
  # GET /callback_statuses/1.json
  def show
  end

  # GET /callback_statuses/new
  def new
    @callback_status = CallbackStatus.new
  end

  # GET /callback_statuses/1/edit
  def edit
  end

  # POST /callback_statuses
  # POST /callback_statuses.json
  def create
    @callback_status = CallbackStatus.new(callback_status_params)

    respond_to do |format|
      if @callback_status.save
        format.html { redirect_to @callback_status, notice: 'Callback status was successfully created.' }
        format.json { render :show, status: :created, location: @callback_status }
      else
        format.html { render :new }
        format.json { render json: @callback_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /callback_statuses/1
  # PATCH/PUT /callback_statuses/1.json
  def update
    respond_to do |format|
      if @callback_status.update(callback_status_params)
        format.html { redirect_to @callback_status, notice: 'Callback status was successfully updated.' }
        format.json { render :show, status: :ok, location: @callback_status }
      else
        format.html { render :edit }
        format.json { render json: @callback_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /callback_statuses/1
  # DELETE /callback_statuses/1.json
  def destroy
    @callback_status.destroy
    respond_to do |format|
      format.html { redirect_to callback_statuses_url, notice: 'Callback status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_callback_status
      @callback_status = CallbackStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def callback_status_params
      params.require(:callback_status).permit(:trans_status, :trans_id, :exttrid, :trans_msg)
    end
end
