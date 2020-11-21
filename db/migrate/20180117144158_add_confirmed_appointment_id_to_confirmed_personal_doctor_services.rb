class AddConfirmedAppointmentIdToConfirmedPersonalDoctorServices < ActiveRecord::Migration
  def change
    add_column :confirmed_personal_doctor_services, :confirmed_appointment_id, :integer
  end
end
