class CreateConfirmedPersonalDoctorServices < ActiveRecord::Migration
  def change
    create_table :confirmed_personal_doctor_services do |t|
      t.string :doctor_id
      t.string :patient_id
      t.string :comment
      t.string :entity_id
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
