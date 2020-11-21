class ChangeAppointmentTypeIdFormatInPreAppointments < ActiveRecord::Migration
  def change
    change_column :pre_appointments, :appointment_type_id, :string
  end
end
