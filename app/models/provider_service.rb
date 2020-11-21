class ProviderService < ActiveRecord::Base
  validates :service_provider_id, presence: {message: "Please Enter a service provider name"}
  validates :service_id, presence: {message: "Please Enter a service"}
  
  belongs_to :service_master, class_name: "ServiceMaster", foreign_key: :service_id 
  belongs_to :provider_master, class_name: "ProviderMaster", foreign_key: :service_provider_id
  
end
