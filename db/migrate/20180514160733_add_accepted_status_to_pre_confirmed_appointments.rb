class AddAcceptedStatusToPreConfirmedAppointments < ActiveRecord::Migration
  def change
    add_column :pre_confirmed_appointments, :accepted_status, :boolean
  end
end
