json.extract! referal, :id, :surname, :other_names, :dob, :contact, :refered_by, :user_id, :active_status, :del_status, :created_at, :updated_at
json.url referal_url(referal, format: :json)
