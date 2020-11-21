class AddAppointmentTypeIdToConfirmedPersonalDoctorServices < ActiveRecord::Migration
  def change
    add_column :confirmed_personal_doctor_services, :appointment_type_id, :string
  end
end
