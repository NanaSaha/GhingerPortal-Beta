class LabDetail < ActiveRecord::Base
    # validates :title, presence: {message: "Please enter a "}
   # self.primary_key = "pre_appointment_id"
   self.primary_key = "confirmed_appt_id"

  belongs_to :pre_appointment, class_name: "PreAppointment", foreign_key: :pre_appointment_id
  belongs_to :confirmed_appointment, class_name: "ConfirmedAppointment", foreign_key: :confirmed_appt_id

  belongs_to :lab_service, class_name: "LabService", foreign_key: :lab_service_id
  
end
