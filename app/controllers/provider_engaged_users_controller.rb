class ProviderEngagedUsersController < ApplicationController
  before_action :set_provider_engaged_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  # GET /provider_engaged_users
  # GET /provider_engaged_users.json
  def index
    @provider_engaged_users = ProviderEngagedUser.all
    @person_infos = PersonInfo.all
  end

  # GET /provider_engaged_users/1
  # GET /provider_engaged_users/1.json
  def show
  end

  # GET /provider_engaged_users/new
  def new
    @provider_engaged_user = ProviderEngagedUser.new
    @provider_id  = params[:provider_id]
    # @provider_engaged_users = ProviderEngagedUser.joins(:provider_master).where("provider_masters.id = provider_engaged_users.provider_id and provider_engaged_users.provider_id = #{@provider_id} ")
    provider = ProviderMaster.find(@provider_id)
    
    @provider_name = provider.provider_name
    
    @person_infos = PersonInfo.order(:surname).where("surname like ?", "%#{params[:person_id]}")
   
    @the_list = @person_infos.map { |a|[a.surname+" "+a.other_names+" ",a.id]  }  
  end

  # GET /provider_engaged_users/1/edit
  def edit
  end
  
  
  def find_saff
    @person_infos = PersonInfo.all
    @provider_id  = params[:provider_id]
    session[:provider_id] = @provider_id
    
    @provider_engaged_users = ProviderEngagedUser.joins(:provider_master).where("provider_masters.id = provider_engaged_users.provider_id and provider_engaged_users.provider_id = #{@provider_id} ")
    provider = ProviderMaster.find(@provider_id)
    
    @provider_name = provider.provider_name
    
    session[:provider_name] = @provider_name
    
    logger.info "Person #{@person_infos.inspect}"
    logger.info "providers is #{@provider_engaged_users.inspect}"
    logger.info "provider name is #{@provider_name.inspect}"
  end
  
  
  # POST /provider_engaged_users
  # POST /provider_engaged_users.json
  def create
    @provider_engaged_user = ProviderEngagedUser.new(provider_engaged_user_params)
    
     @provider_engaged_users = ProviderEngagedUser.joins(:provider_master).where("provider_masters.id = provider_engaged_users.provider_id and provider_engaged_users.provider_id = #{session.delete(:provider_id)} ")
     # @provider_engaged_users = ProviderEngagedUser.joins(:provider_master).where("provider_id = #{session.delete(:provider_id)}")
     @provider_name = session.delete(:provider_name)
     @person_infos = PersonInfo.order(:surname).where("surname like ?", "%#{params[:person_id]}")
   
     @the_list = @person_infos.map { |a|[a.surname+" "+a.other_names+" ",a.id]  } 
       
    respond_to do |format|
      if @provider_engaged_user.save
        format.js { flash.now[:notice] = "Staff was successfully added." }
        format.html { redirect_to @provider_engaged_user, notice: 'Provider engaged user was successfully created.' }
        format.json { render :show, status: :created, location: @provider_engaged_user }
      else
        format.js {render :new}
        format.html { render :new }
        format.json { render json: @provider_engaged_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provider_engaged_users/1
  # PATCH/PUT /provider_engaged_users/1.json
  def update
    @person_infos = PersonInfo.select("surname, other_names")
    respond_to do |format|
      if @provider_engaged_user.update(provider_engaged_user_params)
        format.html { redirect_to @provider_engaged_user, notice: 'Provider engaged user was successfully updated.' }
        format.json { render :show, status: :ok, location: @provider_engaged_user }
      else
        format.html { render :edit }
        format.json { render json: @provider_engaged_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provider_engaged_users/1
  # DELETE /provider_engaged_users/1.json
  def destroy
    @provider_engaged_user.destroy
    respond_to do |format|
      format.html { redirect_to provider_engaged_users_url, notice: 'Provider engaged user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider_engaged_user
      @provider_engaged_user = ProviderEngagedUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_engaged_user_params
      params.require(:provider_engaged_user).permit(:provider_id, :person_id, :comment, :user_id, :entity_id, :active_status, :del_status)
    end
end
