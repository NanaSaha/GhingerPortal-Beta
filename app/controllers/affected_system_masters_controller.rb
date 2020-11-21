class AffectedSystemMastersController < ApplicationController
  before_action :set_affected_system_master, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  #load_and_authorize_resource
  #before_filter :load_permissions

  # GET /affected_system_masters
  # GET /affected_system_masters.json
  def index
    @affected_system_masters = AffectedSystemMaster.all.paginate(:page => params[:page], :per_page => 5).order('id desc')
    
    
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
      @per_page = params[:per_page] || AffectedSystemMaster.per_page || 5
      @affected_system_masters = AffectedSystemMaster.paginate( :per_page => @per_page, :page => params[:page])
   else
    perpage = 5
   end
   @per_page = params[:per_page] || AffectedSystemMaster.per_page || 5
   page = if params[:page]
            params[:page].to_i
           else
            1
           end
   

         
# Filter by human part
if params[:title]
   @part = params[:title]
   logger.info "Then part is #{@part.inspect}"
   @affected_system_masters = AffectedSystemMaster.where(title: @part).paginate( :page => params[:page], :per_page => 5).order('id desc')   
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
      # format.csv { send_data @contacts.to_csv}
    end
  end

  # GET /affected_system_masters/1
  # GET /affected_system_masters/1.json
  def show
  end

  # GET /affected_system_masters/new
  def new
    @affected_system_master = AffectedSystemMaster.new
  end

  # GET /affected_system_masters/1/edit
  def edit
  end

  def enable_part
      part_id=params[:chosen]
      part = AffectedSystemMaster.find(part_id)
     if part.update(:active_status => 1)
       redirect_to affected_system_masters_path, notice: 'Human part was successfully enabled.'
     end
  end

  def disable_part
      part_id=params[:chosen]
      
      part = AffectedSystemMaster.find(part_id)
      
     if part.update(:active_status => 0)
       redirect_to affected_system_masters_path, notice: 'Human part was successfully disabled.'
     end    
  end
  



  # POST /affected_system_masters
  # POST /affected_system_masters.json
  def create
    @affected_system_master = AffectedSystemMaster.new(affected_system_master_params)

    respond_to do |format|
      if @affected_system_master.save
        format.html { redirect_to @affected_system_master, notice: 'Affected system master was successfully created.' }
        format.json { render :show, status: :created, location: @affected_system_master }
      else
        format.html { render :new }
        format.json { render json: @affected_system_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /affected_system_masters/1
  # PATCH/PUT /affected_system_masters/1.json
  def update
    respond_to do |format|
      if @affected_system_master.update(affected_system_master_params)
        format.html { redirect_to @affected_system_master, notice: 'Affected system master was successfully updated.' }
        format.json { render :show, status: :ok, location: @affected_system_master }
      else
        format.html { render :edit }
        format.json { render json: @affected_system_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affected_system_masters/1
  # DELETE /affected_system_masters/1.json
  def destroy
    @affected_system_master.destroy
    respond_to do |format|
      format.html { redirect_to affected_system_masters_url, notice: 'Affected system master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_affected_system_master
      @affected_system_master = AffectedSystemMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def affected_system_master_params
      params.require(:affected_system_master).permit(:title, :comment, :user_id, :entity_id, :active_status, :del_status)
    end
end
