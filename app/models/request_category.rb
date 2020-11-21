class RequestCategory < ActiveRecord::Base
  self.primary_key = 'ref_id'
  
  has_many :pre_appointments
  has_many :confirmed_appointments, through: :pre_appointments
end
