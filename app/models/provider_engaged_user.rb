class ProviderEngagedUser < ActiveRecord::Base
  validates :person_id, presence: {message: "Please select a name to add"}
  
  belongs_to :person_info, class_name: "PersonInfo", foreign_key: :person_id
  belongs_to :provider_master, class_name: "ProviderMaster", foreign_key: :provider_id
end
