class AddColumnRoles < ActiveRecord::Migration
  def change
    add_column :roles, :user_id, :string
    add_column :roles, :comment, :string
    add_column :roles, :active_status, :boolean
    add_column :roles, :del_status, :boolean
  end
end
 