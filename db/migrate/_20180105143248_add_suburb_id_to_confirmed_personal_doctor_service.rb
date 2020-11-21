class AddSuburbIdToConfirmedPersonalDoctorService < ActiveRecord::Migration
  def change
    add_column :confirmed_personal_doctor_services, :suburb_id, :integer
  end
end
