class CreateAffectedSystemMasters < ActiveRecord::Migration
  def change
    create_table :affected_system_masters do |t|
      t.string :title
      t.string :comment
      t.integer :user_id
      t.integer :entity_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
