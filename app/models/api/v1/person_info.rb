module Api
  module V1
    class PersonInfo < ActiveRecord::Base
    validates :other_names, presence: {message: "Please enter a Other"}
    validates :surname, presence: {message: "Please enter a surname"}
    validates :person_type_id, presence: {message: "Please select a player type"}
  
  
      has_many :provider_engaged_users
      belongs_to :person_type_master, class_name: "PersonTypeMaster", foreign_key: :person_type_id
      has_many :person_contact_infos, foreign_key: :person_id
      has_many :person_info_extras
      has_many :users, foreign_key: :person_id
      
      accepts_nested_attributes_for :person_contact_infos, allow_destroy: true
    end

  end
end
