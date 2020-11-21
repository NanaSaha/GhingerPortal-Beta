class AddClosedToPreConfirmedAppointments < ActiveRecord::Migration
  def change
    add_column :pre_confirmed_appointments, :closed, :boolean
  end
end
