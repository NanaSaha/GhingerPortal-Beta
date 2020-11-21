class AddPdDetailsPreAppointmen < ActiveRecord::Migration
  def change
    add_column :pre_appointments, :has_pd, :boolean
    add_column :pre_appointments, :pd_name, :string
  end
end
