class CreateCountryMasters < ActiveRecord::Migration
  def change
    create_table :country_masters do |t|
      t.string :country_name
      t.string :comment
      t.integer :entity_id
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
