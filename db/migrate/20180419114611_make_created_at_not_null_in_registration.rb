class MakeCreatedAtNotNullInRegistration < ActiveRecord::Migration
  def change
    change_column :registration, :created_at, :datetime, null: false
    change_column :registration, :updated_at, :datetime, null: false 
  end
end
