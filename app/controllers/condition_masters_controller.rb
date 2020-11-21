class ConditionMastersController < ApplicationController
  before_action :set_condition_master, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  # GET /condition_masters
  # GET /condition_masters.json
  def index
    @condition_masters = ConditionMaster.all.paginate(:page => params[:page], :per_page => 10).order('id desc')
    
    
     
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
      @per_page = params[:per_page] || ConditionMaster.per_page || 10
      @condition_masters = ConditionMaster.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || ConditionMaster.per_page || 10
   page = if params[:page]
            params[:page].to_i
           else
            1
           end
   

         
# Filter by human part
if params[:condition_name]
   @condition = params[:condition_name]
   logger.info "Then part is #{@condition.inspect}"
   @condition_masters = ConditionMaster.where(condition_name: @condition).paginate( :page => params[:page], :per_page => 10).order('id desc')   
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
      format.csv { send_data @condition_masters.to_csv(options = {}, page, perpage)}
      format.xls { send_data @condition_masters.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
       
  end
  
  def all_condition_excel
    @condition_masters = ConditionMaster.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @condition_masters.to_csv }
      format.xls { send_data @condition_masters.to_csv(options={col_sep: "\t"}) }
    end
  end

  # GET /condition_masters/1
  # GET /condition_masters/1.json
  def show
  end

  # GET /condition_masters/new
  def new
    @condition_master = ConditionMaster.new
  end

  # GET /condition_masters/1/edit
  def edit
  end
  
  def enable_condition
      condition_id = params[:chosen]
      condition = ConditionMaster.find(condition_id)
     if condition.update(:active_status => 1)
       redirect_to condition_masters_path, notice: 'Condition was successfully enabled.'
     end
  end

  def disable_condition
      condition_id=params[:chosen]
      
      condition = ConditionMaster.find(condition_id)
      
     if condition.update(:active_status => 0)
       redirect_to condition_masters_path, notice: 'Condition was successfully disabled.'
     end    
  end
  
  

  # POST /condition_masters
  # POST /condition_masters.json
  def create
    @condition_master = ConditionMaster.new(condition_master_params)

    respond_to do |format|
      if @condition_master.save
        format.html { redirect_to @condition_master, notice: 'Condition master was successfully created.' }
        format.json { render :show, status: :created, location: @condition_master }
      else
        format.html { render :new }
        format.json { render json: @condition_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /condition_masters/1
  # PATCH/PUT /condition_masters/1.json
  def update
    respond_to do |format|
      if @condition_master.update(condition_master_params)
        format.html { redirect_to @condition_master, notice: 'Condition master was successfully updated.' }
        format.json { render :show, status: :ok, location: @condition_master }
      else
        format.html { render :edit }
        format.json { render json: @condition_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /condition_masters/1
  # DELETE /condition_masters/1.json
  def destroy
    @condition_master.destroy
    respond_to do |format|
      format.html { redirect_to condition_masters_url, notice: 'Condition master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condition_master
      @condition_master = ConditionMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def condition_master_params
      params.require(:condition_master).permit(:condition_name, :comment, :user_id, :active_status, :del_status)
    end
end
