json.extract! drug_master, :id, :drug_name, :drug_alias, :comment, :user_id, :active_status, :del_status, :created_at, :updated_at
json.url drug_master_url(drug_master, format: :json)
