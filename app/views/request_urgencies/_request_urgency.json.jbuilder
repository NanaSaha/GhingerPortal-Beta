json.extract! request_urgency, :id, :urgency, :ref_id, :created_at, :updated_at
json.url request_urgency_url(request_urgency, format: :json)
