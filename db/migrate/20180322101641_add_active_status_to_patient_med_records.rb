class AddActiveStatusToPatientMedRecords < ActiveRecord::Migration
  def change
    add_column :patient_med_records, :active_status, :boolean
    add_column :patient_med_records, :del_status, :boolean
    add_column :patient_med_records, :order_status, :boolean
  end
end
