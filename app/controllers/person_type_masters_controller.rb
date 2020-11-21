class PersonTypeMastersController < ApplicationController
  before_action :set_person_type_master, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  #  load_and_authorize_resource
  #  before_filter :load_permissions
  
  # GET /person_type_masters
  # GET /person_type_masters.json
  def index
    @person_type_masters = PersonTypeMaster.all.paginate(:page => params[:page], :per_page => 5).order('id desc')
    @person_infos = PersonInfo.all.paginate(:page => params[:page], :per_page => 10).order('id desc')
    @person_contact_infos = PersonContactInfo.all
    # @person_type = PersonInfo.joins(:person_contact_infos, :person_type_master).last
    @person_info_extra = PersonInfoExtra.all
    @engaged_user_services = EngagedUserService.all.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
    
       # @type = @person_type.person_type_master.user_type_title
       # logger.info "Type is #{@type.inspect}"
    
    
    
    if params[:count]
      params[:count] 
   else
     params[:count] = 5
   end
   
   if params[:page]
     page = params[:page].to_i
   else
     page = 1
   end
   
   if params[:per_page].present?
      # perpage = params[:per_page]
      @per_page = params[:per_page] || PersonTypeMaster.per_page || 5
      @person_type_masters = PersonTypeMaster.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 5
   end
   @per_page = params[:per_page] || PersonTypeMaster.per_page || 5
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
      format.js
      format.html
      format.csv { send_data @contacts.to_csv}
    end
    
    
    
  end

  # GET /person_type_masters/1
  # GET /person_type_masters/1.json
  def show
  end

  # GET /person_type_masters/new
  def new
    @person_type_master = PersonTypeMaster.new
  end

  # GET /person_type_masters/1/edit
  def edit
  end
  
  
  
  def enable_user_type
      type_id=params[:chosen]
      user_type = PersonTypeMaster.find(type_id)
     if user_type.update(:active_status => 1)
       redirect_to person_type_masters_path, notice: 'User type was successfully enabled.'
     end
  end

  def disable_user_type
      type_id=params[:chosen]     
      user_type = PersonTypeMaster.find(type_id)
      
     if user_type.update(:active_status => 0)
       redirect_to person_type_masters_path, notice: 'User type was successfully disabled.'
     end    
  end
  
   
  

  # POST /person_type_masters
  # POST /person_type_masters.json
  def create
    @person_type_master = PersonTypeMaster.new(person_type_master_params)

    respond_to do |format|
      if @person_type_master.save
        format.js { flash.now[:notice] = "User type  was successfully created." }
        format.html { redirect_to @person_type_master, notice: 'Person type master was successfully created.' }
        format.json { render :show, status: :created, location: @person_type_master }
      else
        format.js {render :new}
        format.js {render :new}
        format.html { render :new }
        format.json { render json: @person_type_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_type_masters/1
  # PATCH/PUT /person_type_masters/1.json
  def update
    respond_to do |format|
      if @person_type_master.update(person_type_master_params)
        format.js { flash.now[:notice] = "User type  was successfully Updated." }
        format.html { redirect_to @person_type_master, notice: 'Person type master was successfully updated.' }
        format.json { render :show, status: :ok, location: @person_type_master }
      else
        format.js {render :edit}
        format.html { render :edit }
        format.json { render json: @person_type_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_type_masters/1
  # DELETE /person_type_masters/1.json
  def destroy
    @person_type_master.destroy
    respond_to do |format|
      format.html { redirect_to person_type_masters_url, notice: 'Person type master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_type_master
      @person_type_master = PersonTypeMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_type_master_params
      params.require(:person_type_master).permit(:user_type_title, :comment, :entity, :user_id, :active_status, :del_status)
    end
end
