class AddDateTimeToPreConfirmedAppointments < ActiveRecord::Migration
  def change
    add_column :pre_confirmed_appointments, :date_time, :datetime
  end
end
