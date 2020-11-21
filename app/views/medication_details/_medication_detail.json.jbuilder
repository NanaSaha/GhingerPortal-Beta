json.extract! medication_detail, :id, :confirmed_appt_id, :drug_id, :comment, :user_id, :active_status, :del_status, :created_at, :updated_at
json.url medication_detail_url(medication_detail, format: :json)
