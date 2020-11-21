class AddPaidToConfirmedAppointments < ActiveRecord::Migration
  def change
    add_column :confirmed_appointments, :paid, :boolean, default: nil
  end
end
