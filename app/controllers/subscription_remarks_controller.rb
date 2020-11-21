class SubscriptionRemarksController < ApplicationController
  before_action :set_subscription_remark, only: [:show, :edit, :update, :destroy]

  # GET /subscription_remarks
  # GET /subscription_remarks.json
  def index
    @subscription_remarks = SubscriptionRemark.all
  end

  # GET /subscription_remarks/1
  # GET /subscription_remarks/1.json
  def show
  end

  # GET /subscription_remarks/new
  def new
    @subscription_remark = SubscriptionRemark.new
  end

  # GET /subscription_remarks/1/edit
  def edit
  end

  # POST /subscription_remarks
  # POST /subscription_remarks.json
  def create
    @subscription_remark = SubscriptionRemark.new(subscription_remark_params)

    respond_to do |format|
      if @subscription_remark.save
        format.html { redirect_to @subscription_remark, notice: 'Subscription remark was successfully created.' }
        format.json { render :show, status: :created, location: @subscription_remark }
      else
        format.html { render :new }
        format.json { render json: @subscription_remark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscription_remarks/1
  # PATCH/PUT /subscription_remarks/1.json
  def update
    respond_to do |format|
      if @subscription_remark.update(subscription_remark_params)
        format.html { redirect_to @subscription_remark, notice: 'Subscription remark was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscription_remark }
      else
        format.html { render :edit }
        format.json { render json: @subscription_remark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscription_remarks/1
  # DELETE /subscription_remarks/1.json
  def destroy
    @subscription_remark.destroy
    respond_to do |format|
      format.html { redirect_to subscription_remarks_url, notice: 'Subscription remark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription_remark
      @subscription_remark = SubscriptionRemark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_remark_params
      params.require(:subscription_remark).permit(:name)
    end
end
