class PersonContactInfo < ActiveRecord::Base
   self.primary_key = "person_id"
   
    # validates :person_id, presence: {message: "Please enter a Other"}
    validates :contact_number, presence: {message: "Please enter a contact number"}, uniqueness: true, numericality: { message: "Mobile number must be integers only!" }
     # validates :suburb_id, presence: {message: "Please select a location"}
    validates :email, email: {message: "Invalid email address"}, presence: true
   
   belongs_to :person_info, class_name: "PersonInfo", foreign_key: :person_id
   belongs_to :suburb_master, class_name: "SuburbMaster", foreign_key: :suburb_id
   belongs_to :user, class_name: "User", foreign_key: :user_id
   
    # belongs_to :patient, class_name: "PersonInfo", foreign_key: :patient_id
    # has_many :confirmed_appointments, through: :patients
end
