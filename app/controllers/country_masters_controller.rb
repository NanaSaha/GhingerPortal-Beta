class CountryMastersController < ApplicationController
  before_action :set_country_master, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  # GET /country_masters
  # GET /country_masters.json
  def index
    @country_masters = CountryMaster.all.paginate(:page => params[:page], :per_page => 5).order('id desc')
    @region_masters = RegionMaster.joins(:country_master).where(country_masters: {country_name: 'Ghana'}).paginate(:page => params[:page], :per_page => 5).order('id desc')
    @city_town_masters = CityTownMaster.joins(:region_master).where(region_masters: {region_state_name: "Greater Accra"}).paginate(:page => params[:page], :per_page => 5).order('id desc')
    @suburb_masters = SuburbMaster.joins(:city_town_master).where(city_town_masters: {city_town_name: "Accra"}).paginate(:page => params[:page], :per_page => 5).order('id desc')
    
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
      @per_page = params[:per_page] || CountryMaster.per_page || 5
      @country_masters = CountryMaster.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 5
   end
   @per_page = params[:per_page] || CountryMaster.per_page || 5
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
      format.csv { send_data @country_masters.to_csv(options = {}, page, perpage)}
      format.xls { send_data @country_masters.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    
     # respond_to do |format|
      # format.html
      # format.csv { send_data @account_numbers.to_csv(page, per_page) }
      # format.xls { send_data @account_numbers.to_csv(page,per_page,options={col_sep: "\t"}) }
    # end
     
  end 
 
  # GET /country_masters/1
  # GET /country_masters/1.json
  def show
    # respond_to do |format|
      # format.js { flash[:notice] = "Country master was successfully updated." }
    # end
  end
  
  # GET /country_masters/new
  def new
    @country_master = CountryMaster.new
  end

  # GET /country_masters/1/edit
  def edit
     
  end
  
   
  def all_country_excel
    @country_masters = CountryMaster.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @country_masters.to_csv }
      format.xls { send_data @country_masters.to_csv(options={col_sep: "\t"}) }
    end
  end
  
  def enable_country
      country_id=params[:chosen]
      country = CountryMaster.find(country_id)
     if country.update(:active_status => 1)
       redirect_to country_masters_path, notice: 'Country was successfully enabled.'
     end
  end

  def disable_country
      country_id=params[:chosen]
      
      country = CountryMaster.find(country_id)
      logger.info "country is: #{country.inspect}"
      
     if country.update(:active_status => 0)
       redirect_to country_masters_path, notice: 'Country was successfully disabled.'
     end
     
     
  end
  
  
  def find_countries
    countries = CountryMaster.find(params[:country_id]) 
    
    @region_masters = RegionMaster.where(country_id: countries.id).paginate(:page => params[:page], :per_page => 5).order('id desc')
    @country = countries.country_name
    
    @current_country_id = countries.id
    
    logger.info "Country is: #{@country_masters.inspect}" 
    
    # respond_to do |format|
      # format.js
      # format.html
    # end
    
  end
  

  # POST /country_masters
  # POST /country_masters.json
  def create
    @country_master = CountryMaster.new(country_master_params)
    respond_to do |format|
      if @country_master.save
        format.js { flash.now[:notice] = "Country  was successfully created." }
        format.html { redirect_to @country_master, notice: 'Country master was successfully created.' }
        format.json { render :show, status: :created, location: @country_master }
      else
        format.js {render :new}
        format.html { render :new }
        format.json { render json: @country_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /country_masters/1
  # PATCH/PUT /country_masters/1.json
  def update
    respond_to do |format|
      if @country_master.update(country_master_params)
        format.js { flash.now[:notice] = "Country  was successfully updated." }
        format.html { redirect_to @country_master, notice: 'Country master was successfully updated.' }
        format.json { render :show, status: :ok, location: @country_master }
      else
        format.js { render :edit }
        format.html { render :edit }
        format.json { render json: @country_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /country_masters/1
  # DELETE /country_masters/1.json
  def destroy
    @country_master.destroy
    respond_to do |format|
      format.html { redirect_to country_masters_url, notice: 'Country master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country_master
      @country_master = CountryMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_master_params
      params.require(:country_master).permit(:country_name, :comment, :entity_id, :user_id, :active_status, :change_status)
    end
end
