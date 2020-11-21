class EngagedUserServicesController < ApplicationController
  before_action :set_engaged_user_service, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions

  # GET /engaged_user_services
  # GET /engaged_user_services.json
  def index
    @engaged_user_services = EngagedUserService.all
  end

  # GET /engaged_user_services/1
  # GET /engaged_user_services/1.json
  def show
    
  end

  # GET /engaged_user_services/new
  def new
    @engaged_user_service = EngagedUserService.new
    @user_services = UserService.all
    @engaged_user_services = EngagedUserService.all
    @person_infos = PersonInfo.where.not(person_type_id: ["C"] )
    logger.info @person_infos
    @person_list = @person_infos.map { |a|[a.surname+" "+a.other_names+" ",a.id]  }   
    @person_id = params[:person_id] 
  end

  # GET /engaged_user_services/1/edit
  def edit
  end
  
  #find_engaged_user_service 
  def find_engaged_user_service
     @person_id = params[:person_id]
     logger.info "person id is #{@person_id.inspect}"
     @engaged_user_services = EngagedUserService.where(person_id: @person_id, del_status: false)
     logger.info "engaged services #{@engaged_user_services.inspect}"
     
     @engaged_user_service = EngagedUserService.where(person_id: @person_id, del_status: false)[0]
     if @engaged_user_service.nil?
       flash.now[:notice] = "Sorry there are no subscriptions for the personnel."
     end
     
  end  

  # POST /engaged_user_services 
  # POST /engaged_user_services.json
  def create
    # @engaged_user_service = EngagedUserService.new(engaged_user_service_params)
      @person_id = engaged_user_service_params[:person_id]
      
      done = false #if it iterates successfully
      logger.info "user services #{ params[:user_service_id].inspect}"
      params[:user_service_id].each do |key, value|
        if value.has_key?('checkbox')
          logger.info "value is: #{value}"
          @engaged_user_service = EngagedUserService.new(
              person_id: @person_id,
              user_service_id: value['id'].to_i,
              comment: engaged_user_service_params[:comment],
              user_id: current_user.id,
              active_status: true,
              del_status: false
          )
            if @engaged_user_service.save
                done = true
            else
                done = false
                break #break if there's a problem
            end
        end

      end
  
    respond_to do |format|
      if done == true
        format.js { flash.now[:notice] = "Personnel Services were added successfully."}
        format.html { redirect_to @engaged_user_service, notice: 'Engaged user service was successfully created.' }
        format.json { render :show, status: :created, location: @engaged_user_service }
      else      
        @engaged_user_service =  EngagedUserService.new(engaged_user_service_params)
        @user_services = UserService.all
        @engaged_user_services = EngagedUserService.all
        @person_infos = PersonInfo.where.not(person_type_id: ["C"] )
        logger.info @person_infos
        
        @engaged_user_service.save
        
        @person_list = @person_infos.map { |a|[a.surname+" "+a.other_names+" ",a.id]  }
        format.js { render :new }
        format.html { render :new }
        format.json { render json: @engaged_user_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /engaged_user_services/1
  # PATCH/PUT /engaged_user_services/1.json
  def update
    respond_to do |format|
      if @engaged_user_service.update(engaged_user_service_params)
        format.html { redirect_to @engaged_user_service, notice: 'Engaged user service was successfully updated.' }
        format.json { render :show, status: :ok, location: @engaged_user_service }
      else
        format.html { render :edit }
        format.json { render json: @engaged_user_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /engaged_user_services/1
  # DELETE /engaged_user_services/1.json
  def destroy
    @engaged_user_service.destroy
    respond_to do |format|
      format.html { redirect_to engaged_user_services_url, notice: 'Engaged user service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_engaged_user_service
      @engaged_user_service = EngagedUserService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def engaged_user_service_params
      params.require(:engaged_user_service).permit(:person_id, :user_service_id, :comment, :entity_id, :user_id, :active_status, :del_status)
    end
end
