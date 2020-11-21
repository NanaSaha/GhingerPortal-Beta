class ChangePersonDetailsInConfirmedPersonalDoctorService < ActiveRecord::Migration
  def change
    change_column :confirmed_personal_doctor_services, :doctor_id, 'integer USING CAST(doctor_id AS integer)'
    change_column :confirmed_personal_doctor_services, :patient_id, 'integer USING CAST(patient_id AS integer)'
    change_column :confirmed_personal_doctor_services, :entity_id, 'integer USING CAST(entity_id AS integer)'
  end
end
