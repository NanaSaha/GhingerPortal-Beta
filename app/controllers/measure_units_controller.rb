class MeasureUnitsController < ApplicationController
  before_action :set_measure_unit, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  # load_and_authorize_resource
  # before_filter :load_permissions

  # GET /measure_units
  # GET /measure_units.json
  def index
     @unit = params[:unit_desc]
     if params[:unit_desc]
       @measure_units = MeasureUnit.where(" unit_desc ilike? ", "%#{params[:unit_desc]}%").paginate(:page => params[:page], :per_page => 6).order('created_at desc')
     else
       @measure_units = MeasureUnit.all.paginate(:page => params[:page], :per_page => 6).order('created_at desc')
     end

    respond_to do |format|
      format.html
      format.csv { send_data @measure_units.to_csv }
      format.xls { send_data @measure_units.to_csv(options={col_sep: "\t"}) }
    end

  end

  def all_unit_excel
    @measure_units = MeasureUnit.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      # format.js
      format.csv { send_data @measure_units.to_csv }
      format.xls { send_data @measure_units.to_csv(options={col_sep: "\t"}) }
    end
  end

  # GET /measure_units/1
  # GET /measure_units/1.json
  def show
  end

  # GET /measure_units/new
  def new
    @measure_unit = MeasureUnit.new
  end

  # GET /measure_units/1/edit
  def edit
  end

  # POST /measure_units
  # POST /measure_units.json
  def create
    @measure_unit = MeasureUnit.new(measure_unit_params)

    respond_to do |format|
      if @measure_unit.save
        format.js { flash[:notice]= 'Unit added successfully ' }
        render js: "window.location='#{measure_units_path}'"
        format.html { redirect_to @measure_unit, notice: 'Measure unit was successfully created.' }
        format.json { render :show, status: :created, location: @measure_unit }
      else
        format.js {render :new}
        format.html { render :new }
        format.json { render json: @measure_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measure_units/1
  # PATCH/PUT /measure_units/1.json
  def update
    respond_to do |format|
      if @measure_unit.update(measure_unit_params)
        format.js { flash[:notice]= 'Unit updated successfully ' }
        render js: "window.location='#{measure_units_path}'"
        format.html { redirect_to @measure_unit, notice: 'Measure unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @measure_unit }
      else
        format.js { render :edit }
        format.html { render :edit }
        format.json { render json: @measure_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  def enable_unit
    unit_id = params[:chosen]
    unit = MeasureUnit.find(unit_id)
    if unit.update(:active_status => 1)
      redirect_to measure_units_path, notice: 'Unit was successfully enabled.'
    end
  end

  def disable_unit
    unit_id=params[:chosen]
    unit = MeasureUnit.find(unit_id)
    if unit.update(:active_status => 0)
      redirect_to measure_units_path, notice: 'Unit was successfully disabled.'
    end
  end

  # DELETE /measure_units/1
  # DELETE /measure_units/1.json
  def destroy
    @measure_unit.destroy
    respond_to do |format|
      format.html { redirect_to measure_units_url, notice: 'Measure unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measure_unit
      @measure_unit = MeasureUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measure_unit_params
      params.require(:measure_unit).permit(:unit_desc, :unit_alias, :comment, :user_id, :active_status, :del_status)
    end
end
