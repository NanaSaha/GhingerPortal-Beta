class AppointmentType < ActiveRecord::Base 
  self.primary_key = "ref_id"
  validates :title, presence: {message: "Please enter an appointment type"}
  before_save :titler
  
  
  
  has_many :pre_appointments
  has_many :confirmed_appointments, through: :pre_appointments
  has_many :pre_confirmed_appointments, through: :pre_appointments
  has_many :confirmed_personal_doctor_services  
  has_many :service_fee_masters #foreign_key: :_id

    # def upcase_fields
      # self.title.upcase!
    # end
    
    def titler
      str_list = self.title.split
  
      self.title = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
end
  