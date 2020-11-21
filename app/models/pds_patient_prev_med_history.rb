class PdsPatientPrevMedHistory < ActiveRecord::Base
  
  belongs_to :confirmed_personal_doctor_service, class_name: "ConfirmedPersonalDoctorService", foreign_key: :confirmed_pds_id     
end
