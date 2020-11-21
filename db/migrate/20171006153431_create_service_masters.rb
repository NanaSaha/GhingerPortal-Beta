class CreateServiceMasters < ActiveRecord::Migration
  def change
    create_table :service_masters do |t|
      t.string :title
      t.string :comment
      t.integer :entity_id
      t.integer :user_id
      t.boolean :active_status
      t.boolean :change_status

      t.timestamps null: false
    end
  end
end
