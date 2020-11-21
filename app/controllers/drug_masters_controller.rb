class DrugMastersController < ApplicationController
  before_action :set_drug_master, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  # load_and_authorize_resource
  # before_filter :load_permissions

  # GET /drug_masters
  # GET /drug_masters.json
  def index
    @drug_name = params[:drug_name]
    if params[:drug_name]
      @drug_masters = DrugMaster.where(" drug_name ilike? ", "%#{params[:drug_name]}%").paginate(:page => params[:page], :per_page => 6).order('created_at desc')
    else
     @drug_masters = DrugMaster.all.paginate(:page => params[:page], :per_page => 6).order('created_at desc')
    end

    respond_to do |format|
      format.html
      format.csv { send_data @drug_masters.to_csv }
      format.xls { send_data @drug_masters.to_csv(options={col_sep: "\t"}) }
    end
  end

  def all_drug_excel
    @drug_masters = DrugMaster.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      # format.js
      format.csv { send_data @drug_masters.to_csv }
      format.xls { send_data @drug_masters.to_csv(options={col_sep: "\t"}) }
    end
  end

  # GET /drug_masters/1
  # GET /drug_masters/1.json
  def show
  end

  # GET /drug_masters/news
  def new
    @drug_master = DrugMaster.new
    @drug_master.drug_prices.build

    @measure_units = MeasureUnit.order(:unit_desc).where("unit_desc like ?", "%#{params[:unit_id]}")
    @units = @measure_units.map { |a|[a.unit_desc+" ",a.id]  }
  end

  # GET /drug_masters/1/edit
  def edit
    @measure_units = MeasureUnit.order(:unit_desc).where("unit_desc like ?", "%#{params[:unit_id]}")
    @units = @measure_units.map { |a|[a.unit_desc+" ",a.id]  }
  end

  def enable_drug
    drug_id = params[:chosen]
    drug = DrugMaster.find(drug_id)
    if drug.update(:active_status => 1)
      redirect_to drug_masters_path, notice: 'Drug was successfully enabled.'
    end
  end

  def disable_drug
    drug_id=params[:chosen]
    drug = DrugMaster.find(drug_id)
    if drug.update(:active_status => 0)
      redirect_to drug_masters_path, notice: 'Drug was successfully disabled.'
    end
  end

  # POST /drug_masters
  # POST /drug_masters.json
  def create
    @drug_master = DrugMaster.new(drug_master_params)
    @measure_units = MeasureUnit.order(:unit_desc).where("unit_desc like ?", "%#{params[:unit_id]}")
    @units = @measure_units.map { |a|[a.unit_desc+" ",a.id]  }

    respond_to do |format|
      if @drug_master.save
         format.js { flash[:notice]= 'Drug added successfully ' }
         render js: "window.location='#{drug_masters_path}'"
        format.html { redirect_to drug_masters_path, notice: 'Drug added successfully ' }
        format.json { render :show, status: :created, location: @drug_master }
      else
        format.js { render :new}
        # format.html { render :new }
        format.json { render json: @drug_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drug_masters/1
  # PATCH/PUT /drug_masters/1.json
  def update
    @measure_units = MeasureUnit.order(:unit_desc).where("unit_desc like ?", "%#{params[:unit_id]}")
    @units = @measure_units.map { |a|[a.unit_desc+" ",a.id]  }
    respond_to do |format|
      if @drug_master.update(drug_master_params)
        format.js { flash[:notice]= 'Drug updated successfully ' }
        render js: "window.location='#{drug_masters_path}'"
        format.html { redirect_to drug_masters_path, notice: 'Drug updated successfully' }
        format.json { render :show, status: :ok, location: @drug_master }
      else
        format.js { render :edit }
        # format.html { render :edit }
        format.json { render json: @drug_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drug_masters/1
  # DELETE /drug_masters/1.json
  def destroy
    @drug_master.destroy
    respond_to do |format|
      format.html { redirect_to drug_masters_url, notice: 'Drug master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drug_master
      @drug_master = DrugMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drug_master_params
      params.require(:drug_master).permit(:drug_name, :drug_alias, :comment, :user_id, :active_status, :del_status, drug_prices_attributes: [:id, :drug_id, :price, :unit_id, :comment, :user_id, :active_status, :del_status])
    end
end
