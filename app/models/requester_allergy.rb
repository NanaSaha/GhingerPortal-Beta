class RequesterAllergy < ActiveRecord::Base
  # self.primary_key = "pre_appointment_id"
  self.primary_key = "requester_id"
  
  belongs_to :pre_appointment, class_name: "PreAppointment", foreign_key: :pre_appointment_id
  belongs_to :allergies_master, class_name: "AllergiesMaster", foreign_key: :allergy_id
  belongs_to :person_info, class_name: "PersonInfo", foreign_key: :requester_id
end
 