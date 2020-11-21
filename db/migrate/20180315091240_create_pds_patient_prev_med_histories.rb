class CreatePdsPatientPrevMedHistories < ActiveRecord::Migration
  def change
    create_table :pds_patient_prev_med_histories do |t|
      t.integer :confirmed_pds_id
      t.string :prev_med_histry
      t.integer :user_id
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps null: false
    end
  end
end
