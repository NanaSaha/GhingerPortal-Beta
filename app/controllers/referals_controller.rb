class ReferalsController < ApplicationController
  before_action :set_referal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  
  # GET /referals
  # GET /referals.json
  def index
     # @referals = Referal.all.paginate(:page => params[:page], :per_page => 10).order('created_at desc')
     
     @unprocessed = Referal.where(processed_status: false).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
     @processed = Referal.where(processed_status: true).paginate(:page => params[:page], :per_page => 3).order('created_at desc')
   
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
      @per_page = params[:per_page] || Referal.per_page || 10
      @unprocessed = Referal.where(processed_status: false).paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || Referal.per_page || 10
   page = if params[:page]
            params[:page].to_i
           else
            1
           end
           
    respond_to do |format|
      logger.info "what is the url calling this??: ans #{request.referer}"
      format.js
      format.html
      
      if params[:type] == "unprocessed"
        format.csv { send_data @unprocessed.to_csv(options = {}, page, perpage)}
        format.xls { send_data @unprocessed.to_csv(options={col_sep: "\t"}, page, perpage)}
        
      elsif params[:type] == "processed"
        format.csv { send_data @processed.to_csv(options = {}, page, perpage)}
        format.xls { send_data @processed.to_csv(options={col_sep: "\t"}, page, perpage)}
      end       
    end
  end
  
  def processed_index
     @unprocessed = Referal.where(processed_status: false).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
     @processed = Referal.where(processed_status: true).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
   
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
      @per_page = params[:per_page] || Referal.per_page || 10
      @processed  = Referal.where(processed_status: true).paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || Referal.per_page || 10
   page = if params[:page]
            params[:page].to_i
           else
            1
           end
  end
  
  
  def all_referal_excel
    # @referals = Referal.all.order('created_at desc')
    @unprocessed = Referal.where(processed_status: false).order('created_at desc')
    @processed = Referal.where(processed_status: true).order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html 
      format.js
      if params[:type] == "unprocessed"
        format.csv { send_data @unprocessed.to_csv}
        format.xls { send_data @unprocessed.to_csv(options={col_sep: "\t"})}
        
      elsif params[:type] == "processed"
        format.csv { send_data @processed.to_csv}
        format.xls { send_data @processed.to_csv(options={col_sep: "\t"})}
      end 
      
      # format.csv { send_data @referals.to_csv }
      # format.xls { send_data @referals.to_csv(options={col_sep: "\t"}) }
    end
    
  end

  # GET /referals/1
  # GET /referals/1.json
  def show
  end

  # GET /referals/new
  def new
    @referal = Referal.new
  end
  
  def my_referal
    # @doctor_id = current_user.id
    @referals = Referal.where(refered_by: current_user.id).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
    
    if @referals[0].nil?
      flash.now[:info] = "You do not have any referals to Ghinger Health Care"
    end
    
  end
  
  
  def refer_patient
     @referal = Referal.new 
  end
  
  
  def update_processed_status
      @ref_id = params[:ref_id]
      logger.info "appointment id #{@ref_id.inspect}"
      referal = Referal.find(@ref_id)
      logger.info "appointment #{referal.inspect}"
      if referal.update(processed_status: true)
        flash.now[:notice] = "Status updated successfully"
      end
      
      @unprocessed = Referal.where(processed_status: false).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
      @processed = Referal.where(processed_status: true).paginate(:page => params[:page], :per_page => 10).order('created_at desc')
      
  end


  # GET /referals/1/edit
  def edit
  end
  
  def enable_referal
      referal_id=params[:chosen]
      referal = Referal.find(referal_id)
     if referal.update(:active_status => 1)
       redirect_to referals_path, notice: 'Referal was successfully enabled.'
     end
  end

  def disable_referal
      referal_id=params[:chosen]
      
      referal = Referal.find(referal_id)
     if referal.update(:active_status => 0)
       redirect_to referals_path, notice: 'Referal was successfully disabled.'
     end
     
  end
  

  # POST /referals
  # POST /referals.json
  def create
    @referal = Referal.new(referal_params)

    respond_to do |format|
      if @referal.save
        format.html { redirect_to my_referal_path, notice: 'Referal was successfully created.' }
        format.json { render :show, status: :created, location: @referal }
      else
        format.html { render :refer_patient } 
        format.json { render json: @referal.errors, status: :unprocessable_entity }
      end
    end
  end 

  # PATCH/PUT /referals/1
  # PATCH/PUT /referals/1.json
  def update
    respond_to do |format|
      if @referal.update(referal_params)
        format.html { redirect_to @referal, notice: 'Referal was successfully updated.' }
        format.json { render :show, status: :ok, location: @referal }
      else
        format.html { render :edit }
        format.json { render json: @referal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referals/1
  # DELETE /referals/1.json
  def destroy
    @referal.destroy
    respond_to do |format|
      format.html { redirect_to referals_url, notice: 'Referal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referal
      @referal = Referal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referal_params
      params.require(:referal).permit(:surname, :other_names, :dob, :contact, :refered_by, :user_id, :active_status, :del_status, :processed_status)
    end
end
