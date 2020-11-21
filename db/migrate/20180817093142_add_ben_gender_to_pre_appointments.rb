class AddBenGenderToPreAppointments < ActiveRecord::Migration
  def change
    add_column :pre_appointments, :beneficiary_gender, :string
  end
end
