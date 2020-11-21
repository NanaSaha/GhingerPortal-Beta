class PaymentReq < ActiveRecord::Base
  belongs_to :patient_billing_info, class_name: "PatientBillingInfo", foreign_key: :billing_info_id
end
