class AddUserIdToRegistrations < ActiveRecord::Migration
  def change
    add_column :registration, :user_id, :integer
  end
end
