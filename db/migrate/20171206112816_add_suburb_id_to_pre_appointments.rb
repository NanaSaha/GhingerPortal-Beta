class AddSuburbIdToPreAppointments < ActiveRecord::Migration
  def change
    add_column :pre_appointments, :suburb_id, :integer
  end
end
