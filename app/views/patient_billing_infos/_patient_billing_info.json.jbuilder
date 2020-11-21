json.extract! patient_billing_info, :id, :appointment_id, :approval_status, :approval_date, :payment_status, :payment_date, :comment, :user_id, :active_status, :del_status, :created_at, :updated_at
json.url patient_billing_info_url(patient_billing_info, format: :json)
