json.extract! person_info, :id, :surname, :other_names, :person_type_id, :entity_id, :user_id, :active_status, :del_status, :created_at, :updated_at
json.url person_info_url(person_info, format: :json)
