class AddAttendedToToConfirmedAppointments < ActiveRecord::Migration
  def change
    add_column :confirmed_appointments, :attended_to, :boolean
  end
end
