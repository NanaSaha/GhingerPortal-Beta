class CreateConfirmedConditions < ActiveRecord::Migration
  def change
    create_table :confirmed_conditions do |t|
      t.integer :confirmed_appointment_id
      t.integer :condition_id
      t.boolean :allergy_id
      t.string :comment
      t.integer :user_id
      t.integer :entity
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
