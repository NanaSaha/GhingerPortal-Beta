class AddDoctorIdToConfirmedAppointment < ActiveRecord::Migration
  def change
    add_column :confirmed_appointments, :doctor_id, :integer
  end
end
