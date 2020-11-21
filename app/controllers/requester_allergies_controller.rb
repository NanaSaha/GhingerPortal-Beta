class RequesterAllergiesController < ApplicationController
  before_action :set_requester_allergy, only: [:show, :edit, :update, :destroy, :edit_allergy]
  before_action :authenticate_user!
  # load_and_authorize_resource
  # # before_action :authenticate_user!
  # before_filter :load_permissions
  # GET /requester_allergies
  # GET /requester_allergies.json
  def index
    @requester_allergies = RequesterAllergy.all
  end

  # GET /requester_allergies/1
  # GET /requester_allergies/1.json
  def show
    @pre_appointment_id = params[:pre_appointment_id]
    @requester_id = params[:requester_id]
    logger.info "Pre appointment id is #{@pre_appointment_id}"
    @requester_allergies = RequesterAllergy.where(:requester_id => @requester_id, del_status: false )
    @allergies_masters = AllergiesMaster.all
    logger.info "allergy details is #{@logger.info "Requester id is #{@requester_id}"}"
  end


  # GET /requester_allergies/new
  def new
    @requester_allergy = RequesterAllergy.new
  end

  
  def add_requester_allergy
    @requester_id = params[:requester_id]  
    # @pre_appointment_id = params[:pre_appointment_id]
    @pre_appt = PreAppointment.where(requester_id: @requester_id)[0]
    # @pre_appt = PreAppointment.find(@pre_appointment_id)
    logger.info "Pre appt details is #{@pre_appt.inspect}"
      
    @allergies_masters = AllergiesMaster.all
    @requester_allergies = RequesterAllergy.all 
    @requester_allergy = RequesterAllergy.new
    
    # @existing_allergies = RequesterAllergy.where(pre_appointment_id: @pre_appointment_id)
#       
    # logger.info "Existing allergies #{@existing_allergies.inspect}"
#     
    # if @xisting_allergies.nil?
       # @requester_allergy = RequesterAllergy.new
#       
    # else
      # redirect_to edit_allergy_path
      # flash.now[:notice]= "ssssssssssssssssssssssssssssssssss "
      # # @requester_allergy = RequesterAllergy.new
#       
    # end
   
    # if @existing_allergies.nil?
      # @requester_allergies = RequesterAllergy.all   
      # @requester_allergy = RequesterAllergy.new
#       
    # else
      # @requester_allergies = RequesterAllergy.all   
      # @requester_allergy = RequesterAllergy.new
#       
    # end
    
    # @requester_allergies = RequesterAllergy.all
#     
    # @requester_allergy = RequesterAllergy.new
  end


  # GET /requester_allergies/1/edit
  def edit
    @pre_appointment_id = params[:pre_appointment_id]
  end
  
  
  def edit_allergy
      @pre_appointment_id = params[:id]
      @requester_id = params[:requester_id]
      logger.info "pre appointment id is #{@pre_appointment_id}"
      @pre_appt = PreAppointment.find(@pre_appointment_id)
      logger.info "Pre appt details is #{@pre_appt.inspect}"
      # @requester_id = @pre_appt.requester_id
      @patient_allergies = @pre_appt.allergies
      session[:requester_id] = @requester_id
      
      #@requester_allergies = RequesterAllergy.joins(:allergies_master).where(pre_appointment_id: @pre_appointment_id)
      @allergies_masters = AllergiesMaster.all
      # @requester_allergy = RequesterAllergy.find(@pre_appointment_id)
      
      @requester_allergy = RequesterAllergy.find_by_requester_id(@requester_id)
      # @allegy_list = RequesterAllergy.joins(:allergies_master).where("allergies_masters.id = requester_allergies.allergy_id and requester_allergies.pre_appointment_id = #{@pre_appointment_id} and requester_allergies.del_status = false")
      
      @allegy_list = RequesterAllergy.joins(:allergies_master).where("allergies_masters.id = requester_allergies.allergy_id and requester_allergies.requester_id = #{@requester_id} and requester_allergies.del_status = false")
      
      logger.info "Allergy list is: #{@allegy_list.inspect}"     
      
      @allegy_list = @allegy_list.map {|obj| obj.allergy_id}
      
  end

  # POST /requester_allergies
  # POST /requester_allergies.json
  def create
    @person_infos = PersonInfo.all
     @pre_appointment_id = requester_allergy_params[:pre_appointment_id]
     @requester_id = requester_allergy_params[:requester_id]
     # @requester_allergy = RequesterAllergy.new(requester_allergy_params)

      #"person_list"=>{"1"=>{"checkbox"=>"on", "id"=>"PC10"}, "2"=>{"checkbox"=>"on", "id"=>"PC1"}, "3"=>{"id"=>"PC2"}, "4"=>{"id"=>"PC3"}}, "commit"=>"Submit", "id"=>"1"}
      
      done = false #if it iterates successfully
      logger.info "allergies #{ params[:allergy_id].inspect}"
      params[:allergy_id].each do |key, value|
        if value.has_key?('checkbox')
          logger.info "value is: #{value}"
          group = RequesterAllergy.new(
              pre_appointment_id: requester_allergy_params[:pre_appointment_id],
              allergy_id: value['id'].to_i,
              requester_id: requester_allergy_params[:requester_id],
              comment: '',
              user_id: '',
              active_status: true,
              del_status: false
          )
            if group.save!
                done = true
            else
                done = false
                break #break if there's a problem
            end
        end

      end
      
    respond_to do |format|
      if done
         format.js {flash.now[:notice] = "Allergies were added successfully."}
         @requester_allergies = RequesterAllergy.where(:requester_id => @requester_id, del_status: false )
         # @requester_allergies = RequesterAllergy.where(:pre_appointment_id => @pre_appointment_id, :del_status => false )
        # sql = "SELECT pre_appointment_id, allergy_id FROM requester_allergies WHERE pre_appointment_id = #{@pre_appointment_id}"
        # @requester_allergy = ActiveRecord::Base.connection.execute(sql).values
        logger.info "requester result is #{@requester_allergy.inspect}"
        
        format.html { redirect_to @requester_allergy, notice: 'Requester allergy was successfully created.' }
        format.json { render :show, status: :created, location: @requester_allergy }
      else
        format.js { render :new }
        format.html { render :new }
        format.json { render json: @requester_allergy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requester_allergies/1
  # PATCH/PUT /requester_allergies/1.json
  def update
    # @pre_appointment_id = params[:id]
    # current_list = RequesterAllergy.find_by(pre_appointment_id: @pre_appointment_id, del_status: false)   
    # logger.info "Current Allergies list dkfdkj are #{current_list.inspect}" 
    @requester_id = session.delete(:requester_id)
     # group = RequesterAllergy.find_by(pre_appointment_id: @pre_appointment_id, del_status: false)   
     group = RequesterAllergy.where(requester_id: @requester_id, del_status: false)[0]   
        logger.info "Current Allergies are #{group.inspect}"  
           if group
              group.del_status = true
              group.active_status = false
               group.save #delete it and create new one
           end
         
    respond_to do |format| 
      done = false #if it iterates successfully
        params[:allergy_id].each do |key, value|
               
               # if status_change
                  puts "####################################THE DELETE STATUSES HAVE BEEN CHANGED###################################"
                  logger.info "delete statuses are #{group.inspect}"
                  
                    if value.has_key?('checkbox')  
                       group = RequesterAllergy.new(
                          pre_appointment_id: requester_allergy_params[:pre_appointment_id],
                          allergy_id: value['id'].to_i,
                          requester_id: requester_allergy_params[:requester_id],
                          comment: '',
                          user_id: '',
                          active_status: true,
                          del_status: false
                       )
                        if group.save!
                            done = true
                        else
                            done = false
                            break #break if there's a problem
                        end
                        
                   end
                                              
            end
      
      if done
        format.html { redirect_to group_masters_path, notice: 'Person grouping was successfully updated.' }
        format.json { render :show, status: :ok, location: @person_grouping }
        format.js {flash.now[:notice] = "Allergies were updated successfully."}
        @requester_allergies = RequesterAllergy.where(:requester_id => @requester_id, del_status: false )

     else
        format.js {render :edit}
        format.html { render :edit }
        format.json { render json: @person_grouping.errors, status: :unprocessable_entity }
      end
      
    end

  end

  # DELETE /requester_allergies/1
  # DELETE /requester_allergies/1.json
  def destroy
    @requester_allergy.destroy
    respond_to do |format|
      format.html { redirect_to requester_allergies_url, notice: 'Requester allergy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requester_allergy
       # @requester_allergy = RequesterAllergy.find(params[:id])
       @requester_allergy = RequesterAllergy.find_by_requester_id(params[:requester_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requester_allergy_params
      params.require(:requester_allergy).permit(:pre_appointment_id, :allergy_id, :comment, :user_id, :active_status, :del_status, :requester_id)
    end
end
