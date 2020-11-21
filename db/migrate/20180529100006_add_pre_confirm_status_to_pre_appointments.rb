class AddPreConfirmStatusToPreAppointments < ActiveRecord::Migration
  def change
    add_column :pre_appointments, :pre_confirm_status, :boolean
  end
end
