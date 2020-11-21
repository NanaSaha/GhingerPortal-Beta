class ConfirmedCondition < ActiveRecord::Base
  
  belongs_to :confirmed_appointment, class_name: "ConfirmedAppointment", foreign_key: :confirmed_appointment_id
  
end