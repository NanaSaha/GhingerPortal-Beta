class CreateCityTownMasters < ActiveRecord::Migration
  def change
    create_table :city_town_masters do |t|
      t.string :city_town_name
      t.string :comment
      t.integer :region_id
      t.integer :entity_id
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
