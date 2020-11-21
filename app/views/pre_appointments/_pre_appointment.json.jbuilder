json.extract! pre_appointment, :id, :provider_id, :requester_id, :requester_cat, :beneficiary_name, :appointment_type_id, :proposed_date, :proposed_time, :complaint_desc, :prev_medical_history, :req_urgency, :comment, :user_id, :active_status, :del_status, :created_at, :updated_at
json.url pre_appointment_url(pre_appointment, format: :json)
