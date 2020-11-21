class CreatePersonInfos < ActiveRecord::Migration
  def change
    create_table :person_infos do |t|
      t.string :surname
      t.string :other_names
      t.string :person_type_id
      t.integer :entity_id
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
