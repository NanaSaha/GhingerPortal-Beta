class AddSuburbIdToConfirmedAppointments < ActiveRecord::Migration
  def change
    add_column :confirmed_appointments, :suburb_id, :integer
  end
end
