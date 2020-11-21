class AddHospitalNameToRegistration < ActiveRecord::Migration
  def change
    add_column :registration, :hospital_name, :string
  end
end
