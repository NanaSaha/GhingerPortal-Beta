class PrePaymentReqsController < ApplicationController
  before_action :set_pre_payment_req, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  # load_and_authorize_resource
  # before_filter :load_permissions

  # GET /pre_payment_reqs
  # GET /pre_payment_reqs.json
  def index
    @pre_payment_reqs = PrePaymentReq.all
  end

  # GET /pre_payment_reqs/1
  # GET /pre_payment_reqs/1.json
  def show
  end

  # GET /pre_payment_reqs/new
  def new
    @pre_payment_req = PrePaymentReq.new
  end

  # GET /pre_payment_reqs/1/edit
  def edit
  end

  # POST /pre_payment_reqs
  # POST /pre_payment_reqs.json
  def create
    @pre_payment_req = PrePaymentReq.new(pre_payment_req_params)

    respond_to do |format|
      if @pre_payment_req.save
        format.html { redirect_to @pre_payment_req, notice: 'Pre payment req was successfully created.' }
        format.json { render :show, status: :created, location: @pre_payment_req }
      else
        format.html { render :new }
        format.json { render json: @pre_payment_req.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pre_payment_reqs/1
  # PATCH/PUT /pre_payment_reqs/1.json
  def update
    respond_to do |format|
      if @pre_payment_req.update(pre_payment_req_params)
        format.html { redirect_to @pre_payment_req, notice: 'Pre payment req was successfully updated.' }
        format.json { render :show, status: :ok, location: @pre_payment_req }
      else
        format.html { render :edit }
        format.json { render json: @pre_payment_req.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pre_payment_reqs/1
  # DELETE /pre_payment_reqs/1.json
  def destroy
    @pre_payment_req.destroy
    respond_to do |format|
      format.html { redirect_to pre_payment_reqs_url, notice: 'Pre payment req was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pre_payment_req
      @pre_payment_req = PrePaymentReq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pre_payment_req_params
      params.require(:pre_payment_req).permit(:billing_info_id, :amount, :reference)
    end
end
