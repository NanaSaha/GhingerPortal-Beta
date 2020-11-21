module Api
  module V1
    ## params.require(:data).require(:attributes).permit(:surname, :other_names, :person_type_id, :entity_id, :user_id, :active_status, :del_status, :full_name,person_contact_infos_attributes: [ :id, :person_id, :contact_number, :email, :postal_address, :location_address, :comment, :user_id, :entity_id, :active_status, :del_status, :_destroy ])
      class PersonInfosController < ApplicationController
          before_action :set_person_info, only: [:show, :edit, :update, :destroy]
          
          include TestApi
          # GET /person_infos
          # GET /person_infos.json
          def index
            @person_infos = PersonInfo.all.paginate(:page => params[:page], :per_page => 5).order('id desc')
            @person_contact_infos = PersonContactInfo.all
        
            
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
              @per_page = params[:per_page] || PersonInfo.per_page || 5
              @person_infos = PersonInfo.paginate( :per_page => @per_page, :page => params[:page])
           else
             perpage = 5
           end
           @per_page = params[:per_page] || PersonInfo.per_page || 5
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
        
        
           if params[:user_type_title]
               @person_type = params[:user_type_title]
               logger.info "Then person is #{@person_type.inspect}"
               @person_infos = PersonInfo.joins(:person_type_master).where(person_type_masters: {user_type_title: @person_type}).paginate( :page => params[:page], :per_page => 5).order('id desc')
               
            end 
        
        
        
        
            
            respond_to do |format|
              logger.info "what is the url calling this??: ans #{request.referer}"
              format.js
              format.html
              format.csv { send_data @contacts.to_csv}
            end
          end
        
          # GET /person_infos/1
          # GET /person_infos/1.json
          def show 
          end
        
          # GET /person_infos/new
          def new
            @person_info = PersonInfo.new
            @person_type_masters = PersonTypeMaster.all
            
            @person_info.person_contact_infos.build
          end
        
          # GET /person_infos/1/edit
          def edit
            @person_type_masters = PersonTypeMaster.all
          end
           
          
          def enable_player
              player_id=params[:chosen]
              player = PersonInfo.find(player_id)
             if player.update(:active_status => 1)
               
               redirect_to person_infos_path, notice: 'Player was successfully enabled.'
             end
          end
        
          def disable_player
              player_id=params[:chosen]     
              player = PersonInfo.find(player_id)
              
             if player.update(:active_status => 0)
               redirect_to person_infos_path, notice: 'Player was successfully disabled.'
             end    
          end
        
          
          def filter        
              
          end
        
        
        
          # POST /person_infos
          # POST /person_infos.json
          def create
             @person_info = PersonInfo.new(person_info_params)
             #@person_type_masters = PersonTypeMaster.all    
             respond_to do |format|
               if @person_info.save
                 format.js { flash.now[:notice] = "Player was successfully created." }
                 format.html { redirect_to @person_info, notice: 'Person info was successfully created.' }
                 format.json { render :show, status: :created, location: @person_info }
               else
                 format.js {render :new}
                 format.html { render :new }
                 format.json { render json: @person_info.errors, status: :unprocessable_entity }
               end
             end
            ##createUser
          end
        
        
        
          # PATCH/PUT /person_infos/1
          # PATCH/PUT /person_infos/1.json
          def update
            @person_type_masters = PersonTypeMaster.all
            respond_to do |format|
              if @person_info.update(person_info_params)
                format.js { flash.now[:notice] = "Player was successfully updated." }
                format.html { redirect_to @person_info, notice: 'Person info was successfully updated.' }
                format.json { render :show, status: :ok, location: @person_info }
              else
                format.js {render :edit}
                format.html { render :edit }
                format.json { render json: @person_info.errors, status: :unprocessable_entity }
              end
            end
          end
        
          # DELETE /person_infos/1
          # DELETE /person_infos/1.json
          def destroy
            @person_info.destroy
            respond_to do |format|
              format.html { redirect_to person_infos_url, notice: 'Person info was successfully destroyed.' }
              format.json { head :no_content }
            end
          end
        
          # private
            # Use callbacks to share common setup or constraints between actions.
            def set_person_info
              @person_info = PersonInfo.find(params[:id])
            end
        
            # Never trust parameters from the scary internet, only allow the white list through.
            def person_info_params
              params.require(:person_info).permit(:surname, :other_names, :person_type_id, :entity_id, :user_id, :active_status, :del_status, :full_name, person_contact_infos_attributes: [ :id, :person_id, :contact_number, :email, :postal_address, :location_address, :comment, :user_id, :entity_id, :active_status, :del_status, :_destroy ]  )
            end
        end

    
  end
end