class AddPrescriptionFieldsToPatientMedRecords < ActiveRecord::Migration
  def change
    add_column :patient_med_records, :medicine, :string
    add_column :patient_med_records, :quantity, :integer
    add_column :patient_med_records, :dosage, :string
    add_column :patient_med_records, :frequency, :string
    add_column :patient_med_records, :no_of_days, :integer
  end
end
