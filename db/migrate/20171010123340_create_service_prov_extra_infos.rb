class CreateServiceProvExtraInfos < ActiveRecord::Migration
  def change
    create_table :service_prov_extra_infos do |t|
      t.integer :service_prov_id
      t.integer :suburb_id
      t.string :contact_number1
      t.string :contact_number2
      t.string :postal_address
      t.string :location_address
      t.string :contact_person_name
      t.string :web_url
      t.string :longitude
      t.string :latitude
      t.string :comment
      t.integer :entity_id
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
