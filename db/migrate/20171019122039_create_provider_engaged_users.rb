class CreateProviderEngagedUsers < ActiveRecord::Migration
  def change
    create_table :provider_engaged_users do |t|
      t.integer :provider_id
      t.integer :person_id
      t.string :comment
      t.integer :user_id
      t.integer :entity_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
