json.extract! drug_price, :id, :drug_id, :price, :unit_id, :comment, :user_id, :active_status, :del_status, :created_at, :updated_at
json.url drug_price_url(drug_price, format: :json)
