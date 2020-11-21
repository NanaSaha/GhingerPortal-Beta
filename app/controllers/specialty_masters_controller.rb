class SpecialtyMastersController < ApplicationController
  before_action :set_specialty_master, only: [:show, :edit, :update, :destroy]
 before_action :authenticate_user!
#  load_and_authorize_resource
#  # before_action :authenticate_user!
#  before_filter :load_permissions
  # GET /specialty_masters
  # GET /specialty_masters.json
  def index
    @specialty_masters = SpecialtyMaster.all.paginate(:page => params[:page], :per_page => 10).order('id desc')
    
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
      @per_page = params[:per_page] || SpecialtyMaster.per_page || 10
      @specialty_masters = SpecialtyMaster.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || SpecialtyMaster.per_page || 10
   page = if params[:page]
            params[:page].to_i
           else
            1
           end
   

         
# Filter by human part
if params[:title]
   @specialty = params[:title]
   logger.info "Then part is #{@specialty.inspect}"
   @specialty_masters = SpecialtyMaster.where(title: @specialty).paginate( :page => params[:page], :per_page => 10).order('id desc')   
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
      format.csv { send_data @specialty_masters.to_csv(options = {}, page, perpage)}
      format.xls { send_data @specialty_masters.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
     
  end
  
  def all_specialty_excel
    @specialty_masters = SpecialtyMaster.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @specialty_masters.to_csv }
      format.xls { send_data @specialty_masters.to_csv(options={col_sep: "\t"}) }
    end
  end


  # GET /specialty_masters/1
  # GET /specialty_masters/1.json
  def show
  end

  # GET /specialty_masters/new
  def new
    @specialty_master = SpecialtyMaster.new
  end

  # GET /specialty_masters/1/edit
  def edit
  end
  
  def enable_specialty
      specialty_id=params[:chosen]
      specialty = SpecialtyMaster.find(specialty_id)
     if specialty.update(:active_status => 1)
       redirect_to specialty_masters_path, notice: 'Specialty was successfully enabled.'
     end
  end

  def disable_specialty
      specialty_id=params[:chosen]     
      specialty = SpecialtyMaster.find(specialty_id)     
     if specialty.update(:active_status => 0)
       redirect_to specialty_masters_path, notice: 'Specialty was successfully disabled.'
     end    
  end

  # POST /specialty_masters
  # POST /specialty_masters.json
  def create
    @specialty_master = SpecialtyMaster.new(specialty_master_params)

    respond_to do |format|
      if @specialty_master.save
        format.html { redirect_to @specialty_master, notice: 'Specialty master was successfully created.' }
        format.json { render :show, status: :created, location: @specialty_master }
      else
        format.html { render :new }
        format.json { render json: @specialty_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specialty_masters/1
  # PATCH/PUT /specialty_masters/1.json
  def update
    respond_to do |format|
      if @specialty_master.update(specialty_master_params)
        format.html { redirect_to @specialty_master, notice: 'Specialty master was successfully updated.' }
        format.json { render :show, status: :ok, location: @specialty_master }
      else
        format.html { render :edit }
        format.json { render json: @specialty_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specialty_masters/1
  # DELETE /specialty_masters/1.json
  def destroy
    @specialty_master.destroy
    respond_to do |format|
      format.html { redirect_to specialty_masters_url, notice: 'Specialty master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specialty_master
      @specialty_master = SpecialtyMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def specialty_master_params
      params.require(:specialty_master).permit(:title, :alias, :comment, :user_id, :entity_id, :active_status, :del_status)
    end
end
