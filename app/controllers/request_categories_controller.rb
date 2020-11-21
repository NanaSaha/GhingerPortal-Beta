class RequestCategoriesController < ApplicationController
  before_action :set_request_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  # GET /request_categories
  # GET /request_categories.json
  def index
    @request_categories = RequestCategory.all
  end

  # GET /request_categories/1
  # GET /request_categories/1.json
  def show
  end

  # GET /request_categories/new
  def new
    @request_category = RequestCategory.new
  end

  # GET /request_categories/1/edit
  def edit
  end

  # POST /request_categories
  # POST /request_categories.json
  def create
    @request_category = RequestCategory.new(request_category_params)

    respond_to do |format|
      if @request_category.save
        format.html { redirect_to @request_category, notice: 'Request category was successfully created.' }
        format.json { render :show, status: :created, location: @request_category }
      else
        format.html { render :new }
        format.json { render json: @request_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_categories/1
  # PATCH/PUT /request_categories/1.json
  def update
    respond_to do |format|
      if @request_category.update(request_category_params)
        format.html { redirect_to @request_category, notice: 'Request category was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_category }
      else
        format.html { render :edit }
        format.json { render json: @request_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_categories/1
  # DELETE /request_categories/1.json
  def destroy
    @request_category.destroy
    respond_to do |format|
      format.html { redirect_to request_categories_url, notice: 'Request category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_category
      @request_category = RequestCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_category_params
      params.require(:request_category).permit(:category, :ref_id)
    end
end
