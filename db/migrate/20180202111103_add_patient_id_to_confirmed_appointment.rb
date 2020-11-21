class AddPatientIdToConfirmedAppointment < ActiveRecord::Migration
  def change
    add_column :confirmed_appointments, :patient_id, :integer
  end
end
