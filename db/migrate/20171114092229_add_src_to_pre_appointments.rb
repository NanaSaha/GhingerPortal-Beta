class AddSrcToPreAppointments < ActiveRecord::Migration
  def change
    add_column :pre_appointments, :src, :string
  end
end
