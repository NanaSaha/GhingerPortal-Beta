json.extract! person_info_extra, :id, :person_id, :specialty_id, :specialty_duration, :has_specialty, :forign_training, :foreign_institution_desc, :profession_group_id, :licence_number, :comment, :user_id, :entity_id, :active_status, :del_status, :created_at, :updated_at
json.url person_info_extra_url(person_info_extra, format: :json)
