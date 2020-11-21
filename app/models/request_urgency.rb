class RequestUrgency < ActiveRecord::Base
  self.primary_key ='ref_id'
  
  has_many :pre_appointments
end
