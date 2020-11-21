json.extract! pre_confirmed_appointment, :id, :appointment_id, :doctor_id, :nurse_id, :user_id, :active_status, :del_status, :created_at, :updated_at
json.url pre_confirmed_appointment_url(pre_confirmed_appointment, format: :json)
