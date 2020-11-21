class UserServicesController < ApplicationController
  before_action :set_user_service, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  # GET /user_services
  # GET /user_services.json
  def index
    @user_services = UserService.all.paginate(:page => params[:page], :per_page => 10).order('id desc')
    
     #search
   if params[:count]
      params[:count]
   else
     params[:count] = 10
   end
   
   if params[:page]
     page = params[:page].to_i
   else
     page = 1
   end
   
   if params[:per_page].present?
      # perpage = params[:per_page]
      @per_page = params[:per_page] || UserService.per_page || 10
      @user_services = UserService.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || UserService.per_page || 10
   page = if params[:page]
            params[:page].to_i
           else
            1
           end

 

#            
   # per_page = 5
#    
   # offset = (page - 1) * per_page
   # limit = page * per_page
   # @array = *(offset...limit)


   # if  params[:search_value] && params[:search_value].strip != ''
#      
     # if params[:search_param] == 'firstname'
       # logger.info "the code comes to if  firstname............"
       # @contacts = Contact.firstname_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('ID asc')
#        
      # elsif params[:search_param] == 'lastname'
        # logger.info "the code comes to elsif lastname............."
        # @contacts = Contact.lastname_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('ID asc')
#         
   # else
     # logger.info "the code comes to the else...."
      # @contacts = Contact.paginate(page: params[:page], per_page: params[:count]).order('ID desc')
      # @search_json = []
     # end
#     
    # elsif params[:search_param] == 'date'
       # logger.info "the code comes to elsif date............."
#        
       # start = (params["start_date"] + " " + "0:00:00")# Time.zone.parse(params["start_date"].to_s + " " + "0:00:00").utc # params["start_date"].to_s + "0:00:00"
       # ended = params["end_date"] + " " + ("23:59:59") # Time.zone.parse(params["end_date"].to_s + " " + "23:59:59").utc # params["end_date"].to_s + "23:59:59"
       # @contacts = Contact.search_date(start,ended).paginate(page: params[:page], per_page: params[:count]).order('ID asc')
#  
#      
   # end
   # p "JSON ARRAY: #{@search_json}"
#     

  respond_to do |format|
      logger.info "what is the url calling this??: ans #{request.referer}"
      # format.js
      format.html
      format.csv { send_data @user_services.to_csv(options = {}, page, perpage)}
      format.xls { send_data @user_services.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    

  end
  
  
  def all_user_service_excel
    @user_services = UserService.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @user_services.to_csv }
      format.xls { send_data @user_services.to_csv(options={col_sep: "\t"}) }
    end
  end

  # GET /user_services/1
  # GET /user_services/1.json
  def show
  end

  # GET /user_services/new
  def new
    @user_service = UserService.new
  end

  # GET /user_services/1/edit
  def edit
  end
  
  
  
  def enable_user_service
      service_id=params[:chosen]
      service = UserService.find(service_id)
     if service.update(:active_status => 1)
       redirect_to user_services_path, notice: 'User Service was successfully enabled.'
     end
     
  end


  def disable_user_service
      service_id=params[:chosen]     
      service = UserService.find(service_id)
     if service.update(:active_status => 0)
       redirect_to user_services_path, notice: 'User Service was successfully disabled.'
     end
     
  end
  



  # POST /user_services
  # POST /user_services.json
  def create
    @user_service = UserService.new(user_service_params)

    respond_to do |format|
      if @user_service.save
        format.html { redirect_to @user_service, notice: 'User service was successfully created.' }
        format.json { render :show, status: :created, location: @user_service }
      else
        format.html { render :new }
        format.json { render json: @user_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_services/1
  # PATCH/PUT /user_services/1.json
  def update
    respond_to do |format|
      if @user_service.update(user_service_params)
        format.html { redirect_to @user_service, notice: 'User service was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_service }
      else
        format.html { render :edit }
        format.json { render json: @user_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_services/1
  # DELETE /user_services/1.json
  def destroy
    @user_service.destroy
    respond_to do |format|
      format.html { redirect_to user_services_url, notice: 'User service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_service
      @user_service = UserService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_service_params
      params.require(:user_service).permit(:service_desc, :service_alias, :comment, :entity_id, :user_id, :active_status, :del_status)
    end
end
