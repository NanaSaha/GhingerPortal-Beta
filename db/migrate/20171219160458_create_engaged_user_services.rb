class CreateEngagedUserServices < ActiveRecord::Migration
  def change
    create_table :engaged_user_services do |t|
      t.integer :person_id
      t.integer :user_service_id
      t.string :comment
      t.string :entity_id
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
