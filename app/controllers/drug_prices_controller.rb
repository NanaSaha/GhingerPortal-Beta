class DrugPricesController < ApplicationController
  before_action :set_drug_price, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  # load_and_authorize_resource
  # before_filter :load_permissions

  # GET /drug_prices
  # GET /drug_prices.json
  def index
    @drug_prices = DrugPrice.all
  end

  # GET /drug_prices/1
  # GET /drug_prices/1.json
  def show
  end

  # GET /drug_prices/new
  def new
    @drug_price = DrugPrice.new
  end

  # GET /drug_prices/1/edit
  def edit
  end

  # POST /drug_prices
  # POST /drug_prices.json
  def create
    @drug_price = DrugPrice.new(drug_price_params)

    respond_to do |format|
      if @drug_price.save
        format.html { redirect_to @drug_price, notice: 'Drug price was successfully created.' }
        format.json { render :show, status: :created, location: @drug_price }
      else
        format.html { render :new }
        format.json { render json: @drug_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drug_prices/1
  # PATCH/PUT /drug_prices/1.json
  def update
    respond_to do |format|
      if @drug_price.update(drug_price_params)
        format.html { redirect_to @drug_price, notice: 'Drug price was successfully updated.' }
        format.json { render :show, status: :ok, location: @drug_price }
      else
        format.html { render :edit }
        format.json { render json: @drug_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drug_prices/1
  # DELETE /drug_prices/1.json
  def destroy
    @drug_price.destroy
    respond_to do |format|
      format.html { redirect_to drug_prices_url, notice: 'Drug price was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drug_price
      @drug_price = DrugPrice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drug_price_params
      params.require(:drug_price).permit(:drug_id, :price, :unit_id, :comment, :user_id, :active_status, :del_status)
    end
end
