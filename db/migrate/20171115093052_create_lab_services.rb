class CreateLabServices < ActiveRecord::Migration
  def change
    create_table :lab_services do |t|
      t.string :title
      t.decimal :price
      t.string :comment
      t.string :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
