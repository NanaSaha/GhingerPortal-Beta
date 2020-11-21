json.extract! appointment_type, :id, :title, :comment, :user_id, :entity_id, :active_status, :del_status, :created_at, :updated_at
json.url appointment_type_url(appointment_type, format: :json)
