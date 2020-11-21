class AddNurseIdToConfirmedAppointment < ActiveRecord::Migration
  def change
    add_column :confirmed_appointments, :nurse_id, :integer
  end
end
