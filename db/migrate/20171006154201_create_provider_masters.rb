class CreateProviderMasters < ActiveRecord::Migration
  def change
    create_table :provider_masters do |t|
      t.string :provider_name
      t.string :alias
      t.integer :provider_type_id
      t.string :comment
      t.integer :entity_id
      t.integer :user_id
      t.boolean :active_status
      t.boolean :change_status

      t.timestamps null: false
    end
  end
end
