class CreatePreAppointments < ActiveRecord::Migration
  def change
    create_table :pre_appointments do |t|
      t.integer :provider_id
      t.integer :requester_id
      t.string :requester_cat
      t.string :beneficiary_name
      t.integer :appointment_type_id
      t.datetime :proposed_date
      t.time :proposed_time
      t.string :complaint_desc
      t.string :prev_medical_history
      t.string :req_urgency
      t.string :comment
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
