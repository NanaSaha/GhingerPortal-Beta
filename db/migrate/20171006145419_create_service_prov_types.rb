class CreateServiceProvTypes < ActiveRecord::Migration
  def change
    create_table :service_prov_types do |t|
      t.string :service_prov_type_title
      t.string :comment
      t.integer :entity_id
      t.integer :user_id
      t.boolean :active_status
      t.boolean :change_status

      t.timestamps null: false
    end
  end
end
