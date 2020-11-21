class MedicationDetail < ActiveRecord::Base

  belongs_to :drug_master, class_name: "DrugMaster", foreign_key: :drug_id
  belongs_to :confirmed_appointment, class_name: "ConfirmedAppointment", foreign_key: :confirmed_appt_id
end
