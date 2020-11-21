class CreatePersonContactInfos < ActiveRecord::Migration
  def change
    create_table :person_contact_infos do |t|
      t.integer :person_id
      t.string :contact_number
      t.string :email
      t.string :postal_address
      t.string :location_address
      t.string :comment
      t.integer :user_id
      t.integer :entity_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
