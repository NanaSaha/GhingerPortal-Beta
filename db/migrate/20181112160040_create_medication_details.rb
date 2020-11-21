class CreateMedicationDetails < ActiveRecord::Migration
  def change
    create_table :medication_details do |t|
      t.integer :confirmed_appt_id
      t.integer :drug_id
      t.string :comment
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
