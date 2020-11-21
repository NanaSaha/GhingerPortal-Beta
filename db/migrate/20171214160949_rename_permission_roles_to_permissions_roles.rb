class RenamePermissionRolesToPermissionsRoles < ActiveRecord::Migration
  def change
    rename_table :permission_roles, :permissions_roles
  end
end
