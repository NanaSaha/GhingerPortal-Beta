class CreateRegionMasters < ActiveRecord::Migration
  def change
    create_table :region_masters do |t|
      t.string :region_state_name
      t.string :comment
      t.integer :country_id
      t.integer :entity_id
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
