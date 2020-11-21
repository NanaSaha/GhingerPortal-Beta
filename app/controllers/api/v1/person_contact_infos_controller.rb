class PersonContactInfosController < ApplicationController
  before_action :set_person_contact_info, only: [:show, :edit, :update, :destroy]

  # GET /person_contact_infos
  # GET /person_contact_infos.json
  def index
    @person_contact_infos = PersonContactInfo.all
  end

  # GET /person_contact_infos/1
  # GET /person_contact_infos/1.json
  def show
    @person_contact_info = PersonContactInfo.all
  end

  # GET /person_contact_infos/new
  def new
    @person_contact_info = PersonContactInfo.new
  end

  # GET /person_contact_infos/1/edit
  def edit
  end
  
  
  def find_persons
    person_id = params[:person_id] 
    @person_infos = PersonInfo.find(person_id)
    
    @person_contact_infos = PersonContactInfo.where(person_id: @person_infos.id)[0]
    
    logger.info "contact is #{@person_contact_infos.inspect}"
    logger.info "person is #{@person_infos.inspect}"
     
  end

  # POST /person_contact_infos
  # POST /person_contact_infos.json
  def create
    @person_contact_info = PersonContactInfo.new(person_contact_info_params)

    respond_to do |format|
      if @person_contact_info.save
        format.html { redirect_to @person_contact_info, notice: 'Person contact info was successfully created.' }
        format.json { render :show, status: :created, location: @person_contact_info }
      else
        format.html { render :new }
        format.json { render json: @person_contact_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_contact_infos/1
  # PATCH/PUT /person_contact_infos/1.json
  def update
    respond_to do |format|
      if @person_contact_info.update(person_contact_info_params)
        format.html { redirect_to @person_contact_info, notice: 'Person contact info was successfully updated.' }
        format.json { render :show, status: :ok, location: @person_contact_info }
      else
        format.html { render :edit }
        format.json { render json: @person_contact_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_contact_infos/1
  # DELETE /person_contact_infos/1.json
  def destroy
    @person_contact_info.destroy
    respond_to do |format|
      format.html { redirect_to person_contact_infos_url, notice: 'Person contact info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_contact_info
      @person_contact_info = PersonContactInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_contact_info_params
      params.require(:person_contact_info).permit(:person_id, :contact_number, :email, :postal_address, :location_address, :comment, :user_id, :entity_id, :active_status, :del_status)
    end
end
