class AddConfirmedAppointmentIdToLabdetails < ActiveRecord::Migration
  def change
    add_column :lab_details, :confirmed_appt_id, :integer
  end
end
