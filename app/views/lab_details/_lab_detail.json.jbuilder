json.extract! lab_detail, :id, :pre_appointment_id, :lab_service_id, :comment, :user_id, :active_status, :del_status, :created_at, :updated_at
json.url lab_detail_url(lab_detail, format: :json)
