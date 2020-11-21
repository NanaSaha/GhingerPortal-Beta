module Api
  module V1
    class PersonContactInfo < ActiveRecord::Base
       self.primary_key = "person_id"
       
        # validates :person_id, presence: {message: "Please enter a Other"}
        validates :contact_number, presence: {message: "Please enter a contact number"}
        validates :email, email: {message: "Invalid email address"}, presence: true
       
        belongs_to :person_info, class_name: "PersonInfo", foreign_key: :person_id
    end

  end
end