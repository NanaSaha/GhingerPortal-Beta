class AddRoleIdToPermissionRoles < ActiveRecord::Migration
  def change
    add_column :permission_roles, :role_id, :integer
  end
end
