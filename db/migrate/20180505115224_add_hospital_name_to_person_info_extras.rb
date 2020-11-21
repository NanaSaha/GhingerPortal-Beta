class AddHospitalNameToPersonInfoExtras < ActiveRecord::Migration
  def change
    add_column :person_info_extras, :hospital_name, :string
  end
end
