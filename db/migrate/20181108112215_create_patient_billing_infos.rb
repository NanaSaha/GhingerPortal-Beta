class CreatePatientBillingInfos < ActiveRecord::Migration
  def change
    create_table :patient_billing_infos do |t|
      t.integer :appointment_id
      t.boolean :approval_status, :default => nil
      t.datetime :approval_date 
      t.boolean :payment_status
      t.datetime :payment_date
      t.string :comment
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
      
    end
  end
end
