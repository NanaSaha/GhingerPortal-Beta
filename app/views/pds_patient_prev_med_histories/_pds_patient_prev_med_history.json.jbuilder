json.extract! pds_patient_prev_med_history, :id, :confirmed_pds_id, :prev_med_histry, :user_id, :active_status, :del_status, :created_at, :updated_at
json.url pds_patient_prev_med_history_url(pds_patient_prev_med_history, format: :json)
