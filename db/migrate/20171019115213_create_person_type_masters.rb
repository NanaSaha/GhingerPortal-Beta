class CreatePersonTypeMasters < ActiveRecord::Migration
  def change
    create_table :person_type_masters do |t|
      t.string :user_type_title
      t.string :comment
      t.integer :entity
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
