class CreatePreConfirmedAppointments < ActiveRecord::Migration
  def change
    create_table :pre_confirmed_appointments do |t|
      t.integer :appointment_id
      t.integer :doctor_id
      t.integer :nurse_id
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
