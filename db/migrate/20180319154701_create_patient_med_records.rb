class CreatePatientMedRecords < ActiveRecord::Migration
  def change
    create_table :patient_med_records do |t|
      t.integer :confirmed_appt_id
      t.integer :patient_id
      t.integer :doctor_id
      t.text :clinical_complaints
      t.text :clinical_examinations
      t.text :working_diagnosis
      t.text :investigation_rquired
      t.text :treatments
      t.string :follow_up_plan

      t.timestamps null: false
    end
  end
end
