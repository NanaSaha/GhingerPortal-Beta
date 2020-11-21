class RegionMastersController < ApplicationController
  before_action :set_region_master, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  # GET /region_masters
  # GET /region_masters.json
  def index
    @region_masters = RegionMaster.joins(:country_master).where(country_masters: {country_name: 'Ghana'}).paginate(:page => params[:page], :per_page => 5).order('id desc')
    @country_masters = CountryMaster.all
    # .paginate(:page => params[:page], :per_page => 5).order('id desc')
    # @city_town_masters = CityTownMaster.all
    
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
      @per_page = params[:per_page] || RegionMaster.per_page || 5
      @region_masters = RegionMaster.joins(:country_master).where(country_masters: {country_name: 'GHANA'}).paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 5
   end
   @per_page = params[:per_page] || RegionMaster.per_page || 5
   page = if params[:page]
            params[:page].to_i
           else
            1
           end
          
# Filter by country name

if params[:country_name]
   @country_name = params[:country_name]
   logger.info "Then country is #{@country_name.inspect}"
   @region_masters = RegionMaster.joins(:country_master).where(country_masters: {country_name: @country_name}).paginate( :page => params[:page], :per_page => 5).order('id desc')
   
end



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
      format.csv { send_data RegionMaster.joins(:country_master).paginate(:page => params[:page], :per_page => 5).order('created_at desc').to_csv(options = {}, page, perpage)}
      format.xls { send_data RegionMaster.all.paginate(:page => params[:page], :per_page => 5).order('created_at desc').to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    
    
  end


def filter_by_country_name
  
end



  def all_region_excel
    @region_masters = RegionMaster.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @region_masters.to_csv }
      format.xls { send_data @region_masters.to_csv(options={col_sep: "\t"}) }
    end
  end


  # GET /region_masters/1
  # GET /region_masters/1.json
  def show
     @region_name = @region_master.region_state_name
     logger.info "the region is: #{@region_name}"
  end

  # GET /region_masters/new
  def new
    countries = CountryMaster.find(params[:country_id])
    
    @current_country_id = countries.id
    @country = countries.country_name
    
    @region_master = RegionMaster.new
 
  end

  # GET /region_masters/1/edit
  def edit
     @country_masters = CountryMaster.all 
  end
  
  
  def enable_region
      region_id=params[:chosen]
      region = RegionMaster.find(region_id)
     if region.update(:active_status => 1)
       redirect_to region_masters_path, notice: 'Region was successfully enabled.'
     end
  end

  def disable_region
      region_id=params[:chosen]
      
      region = RegionMaster.find(region_id)
      # logger.info "country is: #{country.inspect}"
      
     if region.update(:active_status => 0)
       redirect_to region_masters_path, notice: 'Region was successfully disabled.'
     end
     
  end
  
  
  

  # POST /region_masters
  # POST /region_masters.json
  def create
    @region_master = RegionMaster.new(region_master_params)

    respond_to do |format|
      if @region_master.save
        @country_masters = CountryMaster.all.paginate(:page => params[:page], :per_page => 5).order('id desc')
        format.js { flash.now[:notice] = "Region  was successfully created." }
        format.html { redirect_to @region_master, notice: 'Region master was successfully created.' }
        format.json { render :show, status: :created, location: @region_master }
      else
        @country_masters = CountryMaster.all 
        format.js {render :new}
        format.html { render :new }
        format.json { render json: @region_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /region_masters/1
  # PATCH/PUT /region_masters/1.json
  def update 
    respond_to do |format|
      if @region_master.update(region_master_params)
        @region_masters = RegionMaster.all.paginate(:page => params[:page], :per_page => 5).order('id desc')
        format.js { flash.now[:notice] = "Region  was successfully updated." }
        format.html { redirect_to @region_master, notice: 'Region master was successfully updated.' }
        format.json { render :show, status: :ok, location: @region_master }
      else
        @country_masters = CountryMaster.all 
        format.js { render :edit}
        format.html { render :edit }
        format.json { render json: @region_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /region_masters/1
  # DELETE /region_masters/1.json
  def destroy
    @region_master.destroy
    respond_to do |format|
      format.html { redirect_to region_masters_url, notice: 'Region master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region_master
      @region_master = RegionMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def region_master_params
      params.require(:region_master).permit(:region_state_name, :comment, :country_id, :entity_id, :user_id, :active_status, :change_status)
    end
end
