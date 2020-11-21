class AddProfDetailFieldsToRegistrations < ActiveRecord::Migration
  def change
    add_column :registration, :specialty_id, :integer
    add_column :registration, :specialty_duration, :string
    add_column :registration, :has_specialty, :boolean
    add_column :registration, :foreign_training, :boolean
    add_column :registration, :foreign_institution, :string
    add_column :registration, :professional_group_id, :integer
    add_column :registration, :licence_number, :string
    add_column :registration, :foreign_licence_number, :string
  end
  
end
