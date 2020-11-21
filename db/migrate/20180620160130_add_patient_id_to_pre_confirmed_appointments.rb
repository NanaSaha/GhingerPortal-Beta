class AddPatientIdToPreConfirmedAppointments < ActiveRecord::Migration
  def change
    add_column :pre_confirmed_appointments, :patient_id, :integer
  end
end
