json.extract! lab_service, :id, :title, :price, :comment, :user_id, :active_status, :del_status, :created_at, :updated_at
json.url lab_service_url(lab_service, format: :json)
