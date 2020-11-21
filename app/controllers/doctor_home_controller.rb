class DoctorHomeController < ApplicationController
  before_action :authenticate_user!
  # load_and_authorize_resource
  # before_filter :load_permissions
  
  def index
    
  end
  
  
end
