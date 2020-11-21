class RenameAppointmentIdToPreAppointmentIdInPreConfirmedAppointments < ActiveRecord::Migration
  def change
    rename_column :pre_confirmed_appointments, :appointment_id, :pre_appointment_id
  end
end
