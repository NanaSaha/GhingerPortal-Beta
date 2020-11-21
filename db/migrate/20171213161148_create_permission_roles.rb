class CreatePermissionRoles < ActiveRecord::Migration
  def change
    create_table :permission_roles do |t|
      t.integer :person_type_master_id
      t.integer :permission_id

      t.timestamps null: false
    end
  end
end
