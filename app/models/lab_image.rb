class LabImage < ActiveRecord::Base
  belongs_to :pre_appointment, class_name: "PreAppointment", foreign_key: :pre_appointment_id
end
