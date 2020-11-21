class AddMedicatioNDurationToPreAppointment < ActiveRecord::Migration
  def change
    add_column :pre_appointments, :medication, :string
    add_column :pre_appointments, :duration, :integer
  end
end
