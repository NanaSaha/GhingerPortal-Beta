class RequestUrgenciesController < ApplicationController
  before_action :set_request_urgency, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  # GET /request_urgencies
  # GET /request_urgencies.json
  def index
    @request_urgencies = RequestUrgency.all
  end

  # GET /request_urgencies/1
  # GET /request_urgencies/1.json
  def show
  end

  # GET /request_urgencies/new
  def new
    @request_urgency = RequestUrgency.new
  end

  # GET /request_urgencies/1/edit
  def edit
  end

  # POST /request_urgencies
  # POST /request_urgencies.json
  def create
    @request_urgency = RequestUrgency.new(request_urgency_params)

    respond_to do |format|
      if @request_urgency.save
        format.html { redirect_to @request_urgency, notice: 'Request urgency was successfully created.' }
        format.json { render :show, status: :created, location: @request_urgency }
      else
        format.html { render :new }
        format.json { render json: @request_urgency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_urgencies/1
  # PATCH/PUT /request_urgencies/1.json
  def update
    respond_to do |format|
      if @request_urgency.update(request_urgency_params)
        format.html { redirect_to @request_urgency, notice: 'Request urgency was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_urgency }
      else
        format.html { render :edit }
        format.json { render json: @request_urgency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_urgencies/1
  # DELETE /request_urgencies/1.json
  def destroy
    @request_urgency.destroy
    respond_to do |format|
      format.html { redirect_to request_urgencies_url, notice: 'Request urgency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_urgency
      @request_urgency = RequestUrgency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_urgency_params
      params.require(:request_urgency).permit(:urgency, :ref_id)
    end
end
