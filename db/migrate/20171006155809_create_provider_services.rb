class CreateProviderServices < ActiveRecord::Migration
  def change
    create_table :provider_services do |t|
      t.integer :service_provider_id
      t.integer :service_id
      t.string :comment
      t.integer :entity_id
      t.integer :user_id
      t.boolean :active_status
      t.boolean :change_status

      t.timestamps null: false
    end
  end
end
