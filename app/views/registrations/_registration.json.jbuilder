json.extract! registration, :id, :surname, :other_names, :mobile_number, :password, :status, :telco, :src, :verified, :email, :username, :user_type, :created_at, :updated_at
json.url registration_url(registration, format: :json)
