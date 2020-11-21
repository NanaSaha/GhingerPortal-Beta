class BillingInfoBillItemsController < ApplicationController
  before_action :set_billing_info_bill_item, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
#  load_and_authorize_resource
 # before_filter :load_permissions

  # GET /billing_info_bill_items
  # GET /billing_info_bill_items.json
  def index
    @billing_info_bill_items = BillingInfoBillItem.all
  end

  # GET /billing_info_bill_items/1
  # GET /billing_info_bill_items/1.json
  def show
  end

  # GET /billing_info_bill_items/new
  def new
    @billing_info_bill_item = BillingInfoBillItem.new
  end

  # GET /billing_info_bill_items/1/edit
  def edit
  end

  # POST /billing_info_bill_items
  # POST /billing_info_bill_items.json
  def create
    @billing_info_bill_item = BillingInfoBillItem.new(billing_info_bill_item_params)

    respond_to do |format|
      if @billing_info_bill_item.save
        format.html { redirect_to @billing_info_bill_item, notice: 'Billing info bill item was successfully created.' }
        format.json { render :show, status: :created, location: @billing_info_bill_item }
      else
        format.html { render :new }
        format.json { render json: @billing_info_bill_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /billing_info_bill_items/1
  # PATCH/PUT /billing_info_bill_items/1.json
  def update
    respond_to do |format|
      if @billing_info_bill_item.update(billing_info_bill_item_params)
        format.html { redirect_to @billing_info_bill_item, notice: 'Billing info bill item was successfully updated.' }
        format.json { render :show, status: :ok, location: @billing_info_bill_item }
      else
        format.html { render :edit }
        format.json { render json: @billing_info_bill_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /billing_info_bill_items/1
  # DELETE /billing_info_bill_items/1.json
  def destroy
    @billing_info_bill_item.destroy
    respond_to do |format|
      format.html { redirect_to billing_info_bill_items_url, notice: 'Billing info bill item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billing_info_bill_item
      @billing_info_bill_item = BillingInfoBillItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def billing_info_bill_item_params
      params.require(:billing_info_bill_item).permit(:billing_info_id, :item_id, :item_price, :item_price, :quantity, :comment, :user_id, :active_status, :del_status)
    end
end
