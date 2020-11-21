class CreateLabDetails < ActiveRecord::Migration
  def change
    create_table :lab_details do |t|
      t.integer :pre_appointment_id
      t.integer :lab_service_id
      t.string :comment
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
