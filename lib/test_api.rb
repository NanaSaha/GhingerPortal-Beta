module TestApi
  def createUser
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
  end
end