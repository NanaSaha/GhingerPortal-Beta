class EngagedUserService < ActiveRecord::Base
    validates :person_id, presence: {message: "Please Enter a personnel"}
    # validates :user_service_id, presence: {message: "Please select at least one service"}
    
    
  belongs_to :person_info, class_name: "PersonInfo", foreign_key: :person_id
  belongs_to :user_service, class_name: "UserService", foreign_key: :user_service_id
  
end
