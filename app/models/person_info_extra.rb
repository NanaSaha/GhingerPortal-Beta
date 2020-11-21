class PersonInfoExtra < ActiveRecord::Base
  before_save :titler
  
  validates :person_id, presence: {message: "Please select a person"}
  validates :specialty_id, presence: {message: "Please select a specialty"}
  validates :specialty_duration, presence: {message: "Please enter the duration of the selected specialty"}
  validates :profession_group_id, presence: {message: "Please enter a medical regulator"}
  validates :licence_number, presence: {message: "Please enter medical licence number"}
  
  belongs_to :person_info, class_name: "PersonInfo", foreign_key: :person_id
  belongs_to :specialty_master, class_name: "SpecialtyMaster", foreign_key: :specialty_id
  belongs_to :profesional_group, class_name: "ProfesionalGroup", foreign_key: :profession_group_id
  belongs_to :user, class_name: "User", foreign_key: :user_id
  
  
  
  def titler
      str_list = self.foreign_institution_desc.split
  
      self.foreign_institution_desc = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
  
end
