json.extract! user_service, :id, :service_desc, :service_alias, :comment, :entity_id, :user_id, :active_status, :del_status, :created_at, :updated_at
json.url user_service_url(user_service, format: :json)
