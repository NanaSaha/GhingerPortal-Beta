class LabDetailImagesController < ApplicationController
  before_action :set_lab_detail_image, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  # GET /lab_detail_images
  # GET /lab_detail_images.json
  def index
    @lab_detail_images = LabDetailImage.all
  end

  # GET /lab_detail_images/1
  # GET /lab_detail_images/1.json
  def show
  end

  # GET /lab_detail_images/new
  def new
    @lab_detail_image = LabDetailImage.new
  end

  # GET /lab_detail_images/1/edit
  def edit
  end
  
  
  def find_lab_detail_image
    @pre_appointment_id = params[:pre_appointment_id]
    @lab_detail_image = LabDetailImage.where(pre_appointment_id: @pre_appointment_id)[0]
  end
  

  # POST /lab_detail_images
  # POST /lab_detail_images.json
  def create
    @lab_detail_image = LabDetailImage.new(lab_detail_image_params)

    respond_to do |format|
      if @lab_detail_image.save
        format.html { redirect_to @lab_detail_image, notice: 'Lab detail image was successfully created.' }
        format.json { render :show, status: :created, location: @lab_detail_image }
      else
        format.html { render :new }
        format.json { render json: @lab_detail_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lab_detail_images/1
  # PATCH/PUT /lab_detail_images/1.json
  def update
    respond_to do |format|
      if @lab_detail_image.update(lab_detail_image_params)
        format.html { redirect_to @lab_detail_image, notice: 'Lab detail image was successfully updated.' }
        format.json { render :show, status: :ok, location: @lab_detail_image }
      else
        format.html { render :edit }
        format.json { render json: @lab_detail_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lab_detail_images/1
  # DELETE /lab_detail_images/1.json
  def destroy
    @lab_detail_image.destroy
    respond_to do |format|
      format.html { redirect_to lab_detail_images_url, notice: 'Lab detail image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab_detail_image
      @lab_detail_image = LabDetailImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lab_detail_image_params
      params.require(:lab_detail_image).permit(:pre_appointment_id, :lab_detail_id, :comment, :user_id, :active_status, :del_status)
    end
end
