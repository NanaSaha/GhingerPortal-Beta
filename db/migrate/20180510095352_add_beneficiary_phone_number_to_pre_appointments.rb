class AddBeneficiaryPhoneNumberToPreAppointments < ActiveRecord::Migration
  def change
    add_column :pre_appointments, :beneficiary_phone_number, :string
  end
end
