class AddRefIdToAppointmentTypes < ActiveRecord::Migration
  def change
    add_column :appointment_types, :ref_id, :string
  end
end
