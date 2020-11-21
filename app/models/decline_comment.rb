class DeclineComment < ActiveRecord::Base
   validates :available_date, presence: {message: "Please provide your available date"}
   belongs_to :pre_confirmed_appointment, class_name: "PreConfirmedAppointment", foreign_key: :pre_confirmed_appointment_id
   belongs_to :doctor, class_name: "PersonInfo", foreign_key: :doctor_id
   belongs_to :nurse, class_name: "PersonInfo", foreign_key: :nurse_id
   
   
end
