class CreateServiceFeeMasters < ActiveRecord::Migration
  def change
    create_table :service_fee_masters do |t|
      t.string :appt_type_id
      t.integer :service_id
      t.string :req_urgency
      t.decimal :fee, precision: 10, scale: 2
      t.string :comment
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
