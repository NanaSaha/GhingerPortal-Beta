class CreateSuburbMasters < ActiveRecord::Migration
  def change
    create_table :suburb_masters do |t|
      t.string :suburb_name
      t.string :comment
      t.integer :city_town_id
      t.integer :entity_id
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
