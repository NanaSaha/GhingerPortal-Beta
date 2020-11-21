class AddConfirmStatusToPreAppointments < ActiveRecord::Migration
  def change
    add_column :pre_appointments, :confirm_status, :boolean
  end
end
