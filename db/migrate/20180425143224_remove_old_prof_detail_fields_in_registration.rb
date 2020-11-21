class RemoveOldProfDetailFieldsInRegistration < ActiveRecord::Migration
  def change
    remove_column :registration, :registration_number
    remove_column :registration, :registration_board
    remove_column :registration, :hospital_name
    remove_column :registration, :specialty
    remove_column :registration, :specialty_name
  end
end
