class ChangeCreatedAtTypeInRegistration < ActiveRecord::Migration
  def change
    remove_column :registration, :created_at
    add_column :registration, :created_at, :datetime
    add_column :registration, :updated_at, :datetime
  end
end
