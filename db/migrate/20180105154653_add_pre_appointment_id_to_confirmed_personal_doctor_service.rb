class AddPreAppointmentIdToConfirmedPersonalDoctorService < ActiveRecord::Migration
  def change
    add_column :confirmed_personal_doctor_services, :pre_appointment_id, :integer
  end
end
