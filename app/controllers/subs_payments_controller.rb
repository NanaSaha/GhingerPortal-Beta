class SubsPaymentsController < ApplicationController
  before_action :set_subs_payment, only: [:show, :edit, :update, :destroy]

  # GET /subs_payments
  # GET /subs_payments.json
  def index
   
    if params[:per_page].present?
      if params[:per_page] == "All"
       @per_page = 10000000000000000
      else
      @per_page = params[:per_page]
      end
     else
   @per_page = 40
  end

  logger.info "----------------------------"
     logger.info "params:: #{params.inspect}"
  logger.info "----------------------------"

  list_of_search_str = []
  list_of_search_str << SubsPayment.transaction_search(params[:trans]) unless params[:trans].blank?

    unless params[:status].blank?
      list_of_search_str << SubsPayment.status_search(params[:status])
     
    end


    list_of_search_str << SubsPayment.search_date(params[:start_date], params[:end_date]) if SubsPayment.search_date(params[:start_date], params[:end_date]) != ""
    search_str = list_of_search_str.join(" AND ")


           logger.info "----------------------------"
           logger.info "list_of_search_str:: #{list_of_search_str.inspect}"
           logger.info "----------------------------"
  
  

    @subs_payments = SubsPayment.where(search_str).paginate(:page => params[:page], :per_page => @per_page).order('created_at desc')
  end

  # GET /subs_payments/1
  # GET /subs_payments/1.json
  def show
  end

  # GET /subs_payments/new
  def new
    @subs_payment = SubsPayment.new
  end

  # GET /subs_payments/1/edit
  def edit
  end

  # POST /subs_payments
  # POST /subs_payments.json
  def create
    @subs_payment = SubsPayment.new(subs_payment_params)

    respond_to do |format|
      if @subs_payment.save
        format.html { redirect_to @subs_payment, notice: 'Subs payment was successfully created.' }
        format.json { render :show, status: :created, location: @subs_payment }
      else
        format.html { render :new }
        format.json { render json: @subs_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subs_payments/1
  # PATCH/PUT /subs_payments/1.json
  def update
    respond_to do |format|
      if @subs_payment.update(subs_payment_params)
        format.html { redirect_to @subs_payment, notice: 'Subs payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @subs_payment }
      else
        format.html { render :edit }
        format.json { render json: @subs_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subs_payments/1
  # DELETE /subs_payments/1.json
  def destroy
    @subs_payment.destroy
    respond_to do |format|
      format.html { redirect_to subs_payments_url, notice: 'Subs payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subs_payment
      @subs_payment = SubsPayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subs_payment_params
      params.require(:subs_payment).permit(:subscription_id, :customer_number, :network, :payment_type, :transaction_id, :amount, :trans_type, :reference, :callback_url, :status, :trans_status, :trans_ref,:card_name,:card_email)
    end
end
