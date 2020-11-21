class CityTownMastersController < ApplicationController
  before_action :set_city_town_master, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  #load_and_authorize_resource
  # before_action :authenticate_user!
  #before_filter :load_permissions
  # GET /city_town_masters
  # GET /city_town_masters.json
  def index
    @city_town_masters = CityTownMaster.joins(:region_master).where(region_masters: {region_state_name: "Greater Accra"}).paginate(:page => params[:page], :per_page => 10).order('id desc')
    @region_masters = RegionMaster.all
    
    
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
      @per_page = params[:per_page] || CityTownMaster.per_page || 10
      @city_town_masters = CityTownMaster.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || CityTownMaster.per_page || 10
   page = if params[:page]
            params[:page].to_i
           else
            1
           end
           
           
          
# Filter by region/state name

if params[:region_state_name]
   @region_name = params[:region_state_name]
   logger.info "Then Region is #{@region_name.inspect}"
   @city_town_masters = CityTownMaster.joins(:region_master).where(region_masters: {region_state_name: @region_name}).paginate( :page => params[:page], :per_page => 10).order('id desc')
   
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
        format.js
        format.html
      # format.csv { send_data @contacts.to_csv}
      format.csv { send_data CityTownMaster.joins(:region_master).paginate(:page => params[:page], :per_page => 5).order('created_at desc').to_csv(options = {}, page, perpage)}
      format.xls { send_data CityTownMaster.all.paginate(:page => params[:page], :per_page => 10).order('created_at desc').to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    
  end
  
  
  def all_city_excel
    @city_town_masters = CityTownMaster.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @city_town_masters.to_csv }
      format.xls { send_data @city_town_masters.to_csv(options={col_sep: "\t"}) }
    end
  end

  # GET /city_town_masters/1
  # GET /city_town_masters/1.json
  def show
  end

  # GET /city_town_masters/new
  def new
    regions =RegionMaster.find(params[:region_id])
    @current_region_id = regions.id
    @region = regions.region_state_name
    @city_town_master = CityTownMaster.new
    # @region_masters = RegionMaster.all
  end

  # GET /city_town_masters/1/edit
  def edit
    @region_masters = RegionMaster.all
  end
  
  def enable_city
      city_id=params[:chosen]
      city = CityTownMaster.find(city_id)
     if city.update(:active_status => 1)
       redirect_to city_town_masters_path, notice: 'City was successfully enabled.'
     end
  end

  def disable_city 
      city_id=params[:chosen]
      
      city = CityTownMaster.find(city_id)
      # logger.info "country is: #{country.inspect}"
      
     if city.update(:active_status => 0)
       redirect_to city_town_masters_path, notice: 'City was successfully disabled.'
     end
     
  end
  
  def find_cities
    regions =RegionMaster.find(params[:region_id])
    @city_town_masters = CityTownMaster.where(region_id: regions.id).paginate(:page => params[:page], :per_page => 5).order('id desc')
     
    @region = regions.region_state_name
    
    @current_region_id = regions.id
    
    logger.info "Region is: #{@region.inspect}" 
  end
  
  

  # POST /city_town_masters
  # POST /city_town_masters.json
  def create
    @city_town_master = CityTownMaster.new(city_town_master_params)

    respond_to do |format|
      if @city_town_master.save
        @region_masters = RegionMaster.all.paginate(:page => params[:page], :per_page => 5).order('id desc')
        format.js { flash.now[:notice] = "City was successfully created." }
        format.html { redirect_to @city_town_master, notice: 'City town master was successfully created.' }
        format.json { render :show, status: :created, location: @city_town_master }
      else
        format.js { render :new }
        format.html { render :new }
        format.json { render json: @city_town_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /city_town_masters/1
  # PATCH/PUT /city_town_masters/1.json
  def update
    respond_to do |format|
      if @city_town_master.update(city_town_master_params)
        @city_town_masters = CityTownMaster.all.paginate(:page => params[:page], :per_page => 5).order('id desc')
        format.js { flash.now[:notice] = "City was successfully updated." }
        format.html { redirect_to @city_town_master, notice: 'City town master was successfully updated.' }
        format.json { render :show, status: :ok, location: @city_town_master }
      else
        @region_masters = RegionMaster.all
        format.js { render :edit }
        format.html { render :edit }
        format.json { render json: @city_town_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /city_town_masters/1
  # DELETE /city_town_masters/1.json
  def destroy
    @city_town_master.destroy
    respond_to do |format|
      format.html { redirect_to city_town_masters_url, notice: 'City town master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city_town_master
      @city_town_master = CityTownMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_town_master_params
      params.require(:city_town_master).permit(:city_town_name, :comment, :region_id, :entity_id, :user_id, :active_status, :change_status)
    end
end
