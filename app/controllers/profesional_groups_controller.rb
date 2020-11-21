class ProfesionalGroupsController < ApplicationController
  before_action :set_profesional_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  # GET /profesional_groups
  # GET /profesional_groups.json
  def index
    @profesional_groups = ProfesionalGroup.all.paginate(:page => params[:page], :per_page => 10).order('id desc')
    
    
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
      @per_page = params[:per_page] || ProfesionalGroup.per_page || 10
      @profesional_groups = ProfesionalGroup.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || ProfesionalGroup.per_page || 10
   page = if params[:page]
            params[:page].to_i
           else
            1
           end
   

         
# Filter by human part
if params[:group_name]
   @group_name = params[:group_name]
   logger.info "Then part is #{@group_name.inspect}"
   @profesional_groups = ProfesionalGroup.where(group_name: @group_name).paginate( :page => params[:page], :per_page => 10).order('id desc')   
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
      format.csv { send_data @profesional_groups.to_csv(options = {}, page, perpage)}
      format.xls { send_data @profesional_groups.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    
    
  end


  def all_group_excel
    @profesional_groups = ProfesionalGroup.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @profesional_groups.to_csv }
      format.xls { send_data @profesional_groups.to_csv(options={col_sep: "\t"}) }
    end
  end
  # GET /profesional_groups/1
  # GET /profesional_groups/1.json
  def show
  end

  # GET /profesional_groups/new
  def new
    @profesional_group = ProfesionalGroup.new
  end

  # GET /profesional_groups/1/edit
  def edit
  end
  
  
  def enable_professional_group
      group_id=params[:chosen]
      group = ProfesionalGroup.find(group_id)
     if group.update(:active_status => 1)
       redirect_to profesional_groups_path, notice: 'Professional group was successfully enabled.'
     end
  end

  def disable_professional_group
      group_id=params[:chosen]     
      group = ProfesionalGroup.find(group_id)     
     if group.update(:active_status => 0)
       redirect_to profesional_groups_path, notice: 'Professional group was successfully disabled.'
     end    
  end
  
  
  # POST /profesional_groups
  # POST /profesional_groups.json
  def create
    @profesional_group = ProfesionalGroup.new(profesional_group_params)

    respond_to do |format|
      if @profesional_group.save
        format.html { redirect_to @profesional_group, notice: 'Profesional group was successfully created.' }
        format.json { render :show, status: :created, location: @profesional_group }
      else
        format.html { render :new }
        format.json { render json: @profesional_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profesional_groups/1
  # PATCH/PUT /profesional_groups/1.json
  def update
    respond_to do |format|
      if @profesional_group.update(profesional_group_params)
        format.html { redirect_to @profesional_group, notice: 'Profesional group was successfully updated.' }
        format.json { render :show, status: :ok, location: @profesional_group }
      else
        format.html { render :edit }
        format.json { render json: @profesional_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profesional_groups/1
  # DELETE /profesional_groups/1.json
  def destroy
    @profesional_group.destroy
    respond_to do |format|
      format.html { redirect_to profesional_groups_url, notice: 'Profesional group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profesional_group
      @profesional_group = ProfesionalGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profesional_group_params
      params.require(:profesional_group).permit(:group_name, :comment, :user_id, :entity_id, :active_status, :del_status)
    end
end
