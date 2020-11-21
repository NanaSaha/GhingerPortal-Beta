class SuburbMastersController < ApplicationController
  before_action :set_suburb_master, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  
  # GET /suburb_masters
  # GET /suburb_masters.json
  def index
    @suburb_masters = SuburbMaster.joins(:city_town_master).where(city_town_masters: {city_town_name: "Madina"}).paginate(:page => params[:page], :per_page => 5).order('id desc')
    @city_town_masters = CityTownMaster.all
    
    #search
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
      @per_page = params[:per_page] || SuburbMaster.per_page || 5
      @suburb_masters = SuburbMaster.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 5
   end
   @per_page = params[:per_page] || SuburbMaster.per_page || 5
   page = if params[:page]
            params[:page].to_i
           else
            1
           end

          
# Filter by city/town name

if params[:city_town_name]
   @city_name = params[:city_town_name]
   logger.info "The city name  is #{@city_name.inspect}"
   @suburb_masters = SuburbMaster.joins(:city_town_master).where(city_town_masters: {city_town_name: @city_name}).paginate( :page => params[:page], :per_page => 5).order('id desc')
   
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
      format.csv { send_data SuburbMaster.joins(:city_town_master).paginate(:page => params[:page], :per_page => 5).order('created_at desc').to_csv(options = {}, page, perpage)}
      format.xls { send_data SuburbMaster.all.paginate(:page => params[:page], :per_page => 10).order('created_at desc').to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    
  end
  
  
   def all_suburb_excel
    @suburb_masters = SuburbMaster.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @suburb_masters.to_csv }
      format.xls { send_data @suburb_masters.to_csv(options={col_sep: "\t"}) }
    end
  end

  # GET /suburb_masters/1
  # GET /suburb_masters/1.json
  def show
  end

  # GET /suburb_masters/new
  def new
    cities = CityTownMaster.find(params[:city_id])
    @current_city_id = cities.id
    @city = cities.city_town_name  
    @suburb_master = SuburbMaster.new
 
  end

  # GET /suburb_masters/1/edit
  def edit
    @city_town_masters = CityTownMaster.all
  end
  
  def enable_suburb
      suburb_id=params[:chosen]
      suburb = SuburbMaster.find(suburb_id)
     if suburb.update(:active_status => 1)
       redirect_to suburb_masters_path, notice: 'Suburb was successfully enabled.'
     end
  end

  def disable_suburb
      suburb_id=params[:chosen]
      
      suburb = SuburbMaster.find(suburb_id)
      # logger.info "country is: #{country.inspect}"
      
     if suburb.update(:active_status => 0)
       redirect_to suburb_masters_path, notice: 'Suburb was successfully disabled.'
     end
     
  end
  
  
 def find_suburbs
   cities = CityTownMaster.find(params[:city_id])
    
    @suburb_masters = SuburbMaster.where(city_town_id: cities.id).paginate(:page => params[:page], :per_page => 5).order('id desc')
     
    @city = cities.city_town_name
    
    @current_city_id = cities.id
    
    logger.info "City is: #{@city.inspect}" 
    logger.info "City id  is: #{@current_city_id.inspect}" 
 end
  

  # POST /suburb_masters
  # POST /suburb_masters.json
  def create
    @suburb_master = SuburbMaster.new(suburb_master_params)

    respond_to do |format|
      if @suburb_master.save
        @city_town_masters = CityTownMaster.all.paginate(:page => params[:page], :per_page => 5).order('id desc')
        format.js { flash.now[:notice] = "Suburb was successfully created"}
        format.html { redirect_to @suburb_master, notice: 'Suburb master was successfully created.' }
        format.json { render :show, status: :created, location: @suburb_master }
      else
        @city_town_masters = CityTownMaster.all
        format.js {render :new }
        format.html { render :new }
        format.json { render json: @suburb_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suburb_masters/1
  # PATCH/PUT /suburb_masters/1.json
  def update
    respond_to do |format|
      if @suburb_master.update(suburb_master_params)
        @suburb_masters = SuburbMaster.all.paginate(:page => params[:page], :per_page => 5).order('id desc')
        format.js { flash.now[:notice] = "Suburb was successfully updated"}
        format.html { redirect_to @suburb_master, notice: 'Suburb master was successfully updated.' }
        format.json { render :show, status: :ok, location: @suburb_master }
      else
        @city_town_masters = CityTownMaster.all
        format.js { render :edit }
        format.html { render :edit }
        format.json { render json: @suburb_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suburb_masters/1
  # DELETE /suburb_masters/1.json
  def destroy
    @suburb_master.destroy
    respond_to do |format|
      format.html { redirect_to suburb_masters_url, notice: 'Suburb master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suburb_master
      @suburb_master = SuburbMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suburb_master_params
      params.require(:suburb_master).permit(:suburb_name, :comment, :city_town_id, :entity_id, :user_id, :active_status, :change_status)
    end
end
