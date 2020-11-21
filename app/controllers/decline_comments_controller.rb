class DeclineCommentsController < ApplicationController
  before_action :set_decline_comment, only: [:show, :edit, :update, :destroy]

  # GET /decline_comments
  # GET /decline_comments.json
  def index
    @decline_comments = DeclineComment.all
  end

  # GET /decline_comments/1
  # GET /decline_comments/1.json
  def show
  end

  # GET /decline_comments/new
  def new
    @decline_comment = DeclineComment.new
    @pre_confirmed_appointment_id = params[:gen_pre_confirm_appt_id]
    @pre_confirmed_appt = PreConfirmedAppointment.find( @pre_confirmed_appointment_id )
    
    @doctor_id = @pre_confirmed_appt.doctor_id
    @nurse_id = @pre_confirmed_appt.nurse_id
    
  end

  # GET /decline_comments/1/edit
  def edit
  end

  # POST /decline_comments
  # POST /decline_comments.json
  def create
    @decline_comment = DeclineComment.new(decline_comment_params)

    respond_to do |format|
      if @decline_comment.save
         @pre_confirmed_appointment_id = decline_comment_params[:pre_confirmed_appointment_id]
         @pre_confirmed_appt = PreConfirmedAppointment.find( @pre_confirmed_appointment_id )        
         @doctor_id = @pre_confirmed_appt.doctor_id
         @nurse_id = @pre_confirmed_appt.nurse_id
         @pre_confirmed_appt.update_attribute('decline_status', true) 
        
        format.js { flash.now[:notice] = "Decline successful"}
        format.html { redirect_to doctor_awaiting_appointments_path, notice: 'Decline comment was successfully created.' }
        format.json { render :show, status: :created, location: @decline_comment }
      else
        format.js { render :new }
        format.html { render :new }
        format.json { render json: @decline_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decline_comments/1
  # PATCH/PUT /decline_comments/1.json
  def update
    respond_to do |format|
      if @decline_comment.update(decline_comment_params)
        format.html { redirect_to @decline_comment, notice: 'Decline comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @decline_comment }
      else
        format.html { render :edit }
        format.json { render json: @decline_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decline_comments/1
  # DELETE /decline_comments/1.json
  def destroy
    @decline_comment.destroy
    respond_to do |format|
      format.html { redirect_to decline_comments_url, notice: 'Decline comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_decline_comment
      @decline_comment = DeclineComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def decline_comment_params
      params.require(:decline_comment).permit(:pre_confirmed_appointment_id,:doctor_id, :nurse_id, :available_date, :comment, :active_status, :del_status)
    end
end
