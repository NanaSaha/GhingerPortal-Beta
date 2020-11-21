json.extract! confirmed_appointment, :id, :pre_appointment_id, :provider_id, :complaint_desc, :confirmed_date, :confirmed_time, :comment, :user_id, :entity_id, :active_status, :del_status, :created_at, :updated_at
json.url confirmed_appointment_url(confirmed_appointment, format: :json)
