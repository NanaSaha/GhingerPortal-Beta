class PatientMedRecord < ActiveRecord::Base 
  # validates :medicine, presence: {message: "Please provide medicine"} if :appt_type
#  
  belongs_to :doctor, class_name: "PersonInfo", foreign_key: :doctor_id
  belongs_to :patient, class_name: "PersonInfo", foreign_key: :patient_id 
  belongs_to :confirmed_appointment, class_name: "ConfirmedAppointment", foreign_key: :confirmed_appt_id

  # def appt_type
   # self.confirmed_appointment.pre_appointment.appointment_type_id == 'PDDP'
  # end
#   
end