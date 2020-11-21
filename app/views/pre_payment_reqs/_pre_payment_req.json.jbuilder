json.extract! pre_payment_req, :id, :billing_info_id, :amount, :reference, :created_at, :updated_at
json.url pre_payment_req_url(pre_payment_req, format: :json)
