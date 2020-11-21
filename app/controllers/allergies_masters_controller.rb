class AllergiesMastersController < ApplicationController
  before_action :set_allergies_master, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
 # load_and_authorize_resource
  # before_action :authenticate_user!
 # before_filter :load_permissions
  # GET /allergies_masters
  # GET /allergies_masters.json
  def index
    @allergies_masters = AllergiesMaster.all.paginate(:page => params[:page], :per_page => 5).order('id desc')
    
    
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
      @per_page = params[:per_page] || AllergiesMaster.per_page || 5
      @allergies_masters = AllergiesMaster.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 5
   end
   @per_page = params[:per_page] || AllergiesMaster.per_page || 5
   page = if params[:page]
            params[:page].to_i
           else
            1
           end
   

         
# Filter by human part
if params[:title]
   @allergy = params[:title]
   logger.info "Then part is #{@allergy.inspect}"
   @allergies_masters = AllergiesMaster.where(title: @allergy).paginate( :page => params[:page], :per_page => 5).order('id desc')   
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
      format.csv { send_data @allergies_masters.to_csv(options = {}, page, perpage)}
      format.xls { send_data @allergies_masters.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
 
  end

  def all_allergies_excel
    @allergies_masters = AllergiesMaster.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @allergies_masters.to_csv }
      format.xls { send_data @allergies_masters.to_csv(options={col_sep: "\t"}) }
    end
  end


  # GET /allergies_masters/1
  # GET /allergies_masters/1.json
  def show
  end

  # GET /allergies_masters/new
  def new
    @allergies_master = AllergiesMaster.new
  end

  # GET /allergies_masters/1/edit
  def edit
  end
  
  def enable_allergy
      allergy_id=params[:chosen]
      allergy = AllergiesMaster.find(allergy_id)
     if allergy.update(:active_status => 1)
       redirect_to allergies_masters_path, notice: 'Allergy was successfully enabled.'
     end
  end

  def disable_allergy
      allergy_id=params[:chosen]
      
      allergy = AllergiesMaster.find(allergy_id)
      
     if allergy.update(:active_status => 0)
       redirect_to allergies_masters_path, notice: 'Allergy was successfully disabled.'
     end    
  end

  # POST /allergies_masters
  # POST /allergies_masters.json
  def create
    @allergies_master = AllergiesMaster.new(allergies_master_params)

    respond_to do |format|
      if @allergies_master.save
        format.html { redirect_to @allergies_master, notice: 'Allergies master was successfully created.' }
        format.json { render :show, status: :created, location: @allergies_master }
      else
        format.html { render :new }
        format.json { render json: @allergies_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /allergies_masters/1
  # PATCH/PUT /allergies_masters/1.json
  def update
    respond_to do |format|
      if @allergies_master.update(allergies_master_params)
        format.html { redirect_to @allergies_master, notice: 'Allergies master was successfully updated.' }
        format.json { render :show, status: :ok, location: @allergies_master }
      else
        format.html { render :edit }
        format.json { render json: @allergies_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allergies_masters/1
  # DELETE /allergies_masters/1.json
  def destroy
    @allergies_master.destroy
    respond_to do |format|
      format.html { redirect_to allergies_masters_url, notice: 'Allergies master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allergies_master
      @allergies_master = AllergiesMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def allergies_master_params
      params.require(:allergies_master).permit(:title, :comment, :user_id, :entity, :active_status, :del_status)
    end
end
