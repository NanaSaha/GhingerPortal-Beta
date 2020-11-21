json.extract! payment_req, :id, :billing_info_id, :amount, :reference, :exttrid, :mobile_number, :nw, :callback_url, :created_at, :updated_at
json.url payment_req_url(payment_req, format: :json)
