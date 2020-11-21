class PatientBillingInfo < ActiveRecord::Base

  has_many :billing_info_bill_items, foreign_key: :billing_info_id
  has_many :payment_reqs, foreign_key: :billing_info_id
  belongs_to :confirmed_appointment, class_name: "ConfirmedAppointment", foreign_key: :appointment_id

  accepts_nested_attributes_for :billing_info_bill_items, allow_destroy: true
                                # reject_if: proc { |attributes| attributes['billing_info_id'].blank? },

end
