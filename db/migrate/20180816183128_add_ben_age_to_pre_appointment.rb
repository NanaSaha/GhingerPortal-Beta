class AddBenAgeToPreAppointment < ActiveRecord::Migration
  def change
    add_column :pre_appointments, :beneficiary_age, :integer
  end
end
