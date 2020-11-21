class PaymentReqsController < ApplicationController
  before_action :set_payment_req, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  # load_and_authorize_resource
  # before_filter :load_permissions

  # GET /payment_reqs
  # GET /payment_reqs.json
  def index
    @payment_reqs = PaymentReq.all
  end

  # GET /payment_reqs/1
  # GET /payment_reqs/1.json
  def show
  end

  # GET /payment_reqs/new
  def new
    @payment_req = PaymentReq.new
  end

  # GET /payment_reqs/1/edit
  def edit
  end

  # POST /payment_reqs
  # POST /payment_reqs.json
  def create
    @payment_req = PaymentReq.new(payment_req_params)

    respond_to do |format|
      if @payment_req.save
        format.html { redirect_to @payment_req, notice: 'Payment req was successfully created.' }
        format.json { render :show, status: :created, location: @payment_req }
      else
        format.html { render :new }
        format.json { render json: @payment_req.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_reqs/1
  # PATCH/PUT /payment_reqs/1.json
  def update
    respond_to do |format|
      if @payment_req.update(payment_req_params)
        format.html { redirect_to @payment_req, notice: 'Payment req was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_req }
      else
        format.html { render :edit }
        format.json { render json: @payment_req.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_reqs/1
  # DELETE /payment_reqs/1.json
  def destroy
    @payment_req.destroy
    respond_to do |format|
      format.html { redirect_to payment_reqs_url, notice: 'Payment req was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_req
      @payment_req = PaymentReq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_req_params
      params.require(:payment_req).permit(:billing_info_id, :amount, :reference, :exttrid, :mobile_number, :nw, :callback_url)
    end
end
