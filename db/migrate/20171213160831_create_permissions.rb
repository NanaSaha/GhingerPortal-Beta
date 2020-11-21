class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :subjuct_class
      t.string :action
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
