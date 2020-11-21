class CreateConditionMasters < ActiveRecord::Migration
  def change
    create_table :condition_masters do |t|
      t.string :condition_name
      t.string :comment
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
