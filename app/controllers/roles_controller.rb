class RolesController < ApplicationController
  require 'will_paginate/array'
  
  before_action :set_role, only: [:show, :edit, :update, :destroy]

   before_filter :is_super_admin?

  # GET /roles
  # GET /roles.json
  def index
     @roles = Role.all.paginate(:page => params[:page], :per_page => 10).order('id desc')
    
    
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
      @per_page = params[:per_page] || Role.per_page || 10
      @roles = Role.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || Role.per_page || 10
   page = if params[:page]
            params[:page].to_i
           else
            1
           end
   

         
# Filter by human part
if params[:name]
   @name = params[:name]
   logger.info "Then part is #{@name.inspect}"
   @roles = Role.where(name: @name).paginate( :page => params[:page], :per_page => 10).order('id desc')   
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
      format.csv { send_data @roles.to_csv(options = {}, page, perpage)}
      format.xls { send_data @roles.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
  end
  
  def all_role_excel 
    @roles = Role.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @roles.to_csv }
      format.xls { send_data @roles.to_csv(options={col_sep: "\t"}) }
    end
  end


  # GET /roles/1
  # GET /roles/1.json
  def show
    @permissions = @role.permissions
  end

  # GET /roles/new
  def new
    @role = Role.new
    @permissions = Permission.where("id != '1'").where("subject_class !='Role'").compact
    @role_permissions = @role.permissions.collect{|p| p.id}
  end

  # GET /roles/1/edit
  def edit
    @permissions = Permission.where("id != '1'").where("subject_class !='Role'").compact
    @role_permissions = @role.permissions.collect{|p| p.id}
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(role_params) 
    @role.permissions = []
    @role.set_permissions(params[:permissions]) if params[:permissions]

    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: 'Role was successfully created.' }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    @role.permissions = []
    @role.set_permissions(params[:permissions]) if params[:permissions]
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @role, notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url, notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:name, :active_status, :comment, :user_id, :del_status, :permissions => [])
    end
    
    def is_super_admin?
       redirect_to root_path and return unless current_user.super_admin?

    end


















# 
  # # GET /roles
  # # GET /roles.json
  # def index
    # @roles = Role.all.paginate(:page => params[:page], :per_page => 10).order('id desc')
#     
#     
     # if params[:count]
      # params[:count]
    # else
     # params[:count] = 10
    # end
#    
   # if params[:page]
     # page = params[:page].to_i
   # else
     # page = 1
   # end
#    
   # if params[:per_page].present?
      # # perpage = params[:per_page]
      # @per_page = params[:per_page] || Role.per_page || 10
      # @roles = Role.paginate( :per_page => @per_page, :page => params[:page])
   # else
     # perpage = 10
   # end
   # @per_page = params[:per_page] || Role.per_page || 10
   # page = if params[:page]
            # params[:page].to_i
           # else
            # 1
           # end
#    
# 
#          
# # Filter by human part
# if params[:name]
   # @name = params[:name]
   # logger.info "Then part is #{@name.inspect}"
   # @roles = Role.where(name: @name).paginate( :page => params[:page], :per_page => 10).order('id desc')   
# end
# 
# 
#    
# #            
   # # per_page = 5
# #    
   # # offset = (page - 1) * per_page
   # # limit = page * per_page
   # # @array = *(offset...limit)
# 
# 
   # # if  params[:search_value] && params[:search_value].strip != ''
# #      
     # # if params[:search_param] == 'firstname'
       # # logger.info "the code comes to if  firstname............"
       # # @contacts = Contact.firstname_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('ID asc')
# #        
      # # elsif params[:search_param] == 'lastname'
        # # logger.info "the code comes to elsif lastname............."
        # # @contacts = Contact.lastname_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('ID asc')
# #         
   # # else
     # # logger.info "the code comes to the else...."
      # # @contacts = Contact.paginate(page: params[:page], per_page: params[:count]).order('ID desc')
      # # @search_json = []
     # # end
# #     
    # # elsif params[:search_param] == 'date'
       # # logger.info "the code comes to elsif date............."
# #        
       # # start = (params["start_date"] + " " + "0:00:00")# Time.zone.parse(params["start_date"].to_s + " " + "0:00:00").utc # params["start_date"].to_s + "0:00:00"
       # # ended = params["end_date"] + " " + ("23:59:59") # Time.zone.parse(params["end_date"].to_s + " " + "23:59:59").utc # params["end_date"].to_s + "23:59:59"
       # # @contacts = Contact.search_date(start,ended).paginate(page: params[:page], per_page: params[:count]).order('ID asc')
# #  
# #      
   # # end
   # # p "JSON ARRAY: #{@search_json}"
# #     
#     
    # respond_to do |format|
      # logger.info "what is the url calling this??: ans #{request.referer}"
      # # format.js
      # format.html
      # # format.csv { send_data @contacts.to_csv}
    # end
#     
#     
#   
  # end
# 
  # # GET /roles/1
  # # GET /roles/1.json
  # def show
  # end
# 
  # # GET /roles/new
  # def new
    # @role = Role.new
  # end
# 
  # # GET /roles/1/edit
  # def edit
  # end
# 
  # def enable_role
      # role_id=params[:chosen]
      # role = Role.find(role_id)
     # if role.update(:active_status => 1)
       # redirect_to roles_path, notice: 'Role was successfully enabled.'
     # end
  # end
# 
  # def disable_role
      # role_id=params[:chosen]     
      # role = Role.find(role_id)     
     # if role.update(:active_status => 0)
       # redirect_to roles_path, notice: 'Role was successfully disabled.'
     # end    
  # end
#   
# 
# 
#     
  # # POST /roles
  # # POST /roles.json
  # def create
    # @role = Role.new(role_params)
# 
    # respond_to do |format|
      # if @role.save
        # format.html { redirect_to @role, notice: 'Role was successfully created.' }
        # format.json { render :show, status: :created, location: @role }
      # else
        # format.html { render :new }
        # format.json { render json: @role.errors, status: :unprocessable_entity }
      # end
    # end
  # end
# 
  # # PATCH/PUT /roles/1
  # # PATCH/PUT /roles/1.json
  # def update
    # respond_to do |format|
      # if @role.update(role_params)
        # format.html { redirect_to @role, notice: 'Role was successfully updated.' }
        # format.json { render :show, status: :ok, location: @role }
      # else
        # format.html { render :edit }
        # format.json { render json: @role.errors, status: :unprocessable_entity }
      # end
    # end
  # end
# 
  # # DELETE /roles/1
  # # DELETE /roles/1.json
  # def destroy
    # @role.destroy
    # respond_to do |format|
      # format.html { redirect_to roles_url, notice: 'Role was successfully destroyed.' }
      # format.json { head :no_content }
    # end
  # end
# 
  # private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_role
      # @role = Role.find(params[:id])
    # end
# 
    # # Never trust parameters from the scary internet, only allow the white list through.
    # def role_params
      # params.require(:role).permit(:name, :active_status, :comment, :user_id, :del_status)
    # end
#     
    
end
