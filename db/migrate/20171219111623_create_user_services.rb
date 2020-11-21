class CreateUserServices < ActiveRecord::Migration
  def change
    create_table :user_services do |t|
      t.string :service_desc
      t.string :service_alias
      t.string :comment
      t.integer :entity_id
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
