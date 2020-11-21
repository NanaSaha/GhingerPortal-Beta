json.extract! person_contact_info, :id, :person_id, :contact_number, :email, :postal_address, :location_address, :comment, :user_id, :entity_id, :active_status, :del_status, :created_at, :updated_at
json.url person_contact_info_url(person_contact_info, format: :json)
