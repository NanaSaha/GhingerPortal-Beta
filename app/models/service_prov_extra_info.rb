class ServiceProvExtraInfo < ActiveRecord::Base
    self.primary_key = "service_prov_id"
    
  
    # validates :service_prov_id, presence: {message: "Please Enter a service provider name"}
    validates :suburb_id, presence: {message: "Please Enter a suburb name"}
    validates :contact_number1, presence: {message: "Please Enter a contact number"}
  
  belongs_to :suburb_master, class_name: "SuburbMaster", foreign_key: :suburb_id
  belongs_to :provider_master, class_name: "ProviderMaster", foreign_key: :service_prov_id
  
end
 