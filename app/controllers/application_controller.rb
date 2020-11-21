class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  # protect_from_forgery prepend: true
  
 
  # before_action :authenticate_user!
  before_filter :set_cache_headers
  add_flash_types :success, :warning, :danger, :info
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  
#  rescue_from CanCan::AccessDenied do |exception|
 #   flash[:danger] = "Sorry, you are not permitted to access the requested page!"
  #    redirect_to request.referer
     # redirect_to current_user   
 # end
   
   
   
   
   
   
  # def set_no_cache
    # response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    # response.headers["Pragma"] = "no-cache"
    # response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  # end

  





 protected
 
 def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    # response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    # response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
 
 #derive the model name from the controller. egs UsersController will return User
#  def self.permission
 #   return name = self.name.gsub('Controller','').singularize.split('::').last.constantize.name rescue nil
 # end
 
  #def current_ability
   # @current_ability ||= Ability.new(current_user)
 # end
 
  #load the permissions for the current user so that UI can be manipulated
 # def load_permissions
  #  @current_permissions = current_user.role.permissions.collect{|i| [i.subject_class, i.action]}
  #end
 
 
 
 
 def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :current_password, :user_type_id,:creator_id, :remember_me]) 
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email,:login, :password, :user_type_id,:creator_id,:remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :email, :password, :password_confirmation, :current_password, :user_type_id,:entity_master_id,:creator_id])
  end


  
  
  #  def after_sign_in_path_for(resource)
  #     if resource.role.name == 'Super Admin' or resource.role.name == 'Customer Service'
  #        admin_root_path
  #     elsif resource.role.name == 'Doctor'
  #        doctor_root_path
  #     elsif resource.role.name == 'Nurse'
  #       nurse_root_path
  #     elsif resource.role.name == 'Patient'
  #        root_path
  #     end
  # end

   def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
    end

    def store_user_location!
      # :user is the scope we are authenticating
      store_location_for(:user, request.fullpath)
    end
    


   def after_sign_in_path_for(resource_or_scope)
  stored_location_for(resource_or_scope) || super
end
  
  
  
end
