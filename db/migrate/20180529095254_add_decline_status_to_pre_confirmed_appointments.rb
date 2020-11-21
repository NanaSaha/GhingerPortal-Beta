class AddDeclineStatusToPreConfirmedAppointments < ActiveRecord::Migration
  def change
    add_column :pre_confirmed_appointments, :decline_status, :boolean
  end
end
