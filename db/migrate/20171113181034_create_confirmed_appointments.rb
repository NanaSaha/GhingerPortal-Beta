class CreateConfirmedAppointments < ActiveRecord::Migration
  def change
    create_table :confirmed_appointments do |t|
      t.integer :pre_appointment_id
      t.integer :provider_id
      t.string :complaint_desc
      t.datetime :confirmed_date
      t.time :confirmed_time
      t.string :comment
      t.integer :user_id
      t.integer :entity_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
