class BillingInfoBillItem < ActiveRecord::Base
  before_save :calculate

  belongs_to :patient_billing_info, class_name: "PatientBillingInfo", foreign_key: :billing_info_id


  def calculate
    bill_id = self.billing_info_id
    bill = PatientBillingInfo.find(bill_id)
    item_id = self.item_id
    if bill.confirmed_appointment.pre_appointment.appointment_type_id == "MD"
      drug_prices = DrugPrice.where(drug_id: item_id, active_status: true, del_status: false)[0] #find_by_drug_id(item_id)
      price = drug_prices.price
      qty = self.quantity
      total_price  = price * qty
      self.item_price = total_price

    elsif bill.confirmed_appointment.pre_appointment.appointment_type_id == "LA"
      if bill.confirmed_appointment.pre_appointment.req_urgency == "S"
        lab_price = ServiceFeeMaster.where(appt_type_id: "LA", req_urgency: "S", service_id: item_id, active_status: true, del_status: false)[0]
      elsif bill.confirmed_appointment.pre_appointment.req_urgency == "E"
        lab_price = ServiceFeeMaster.where(appt_type_id: "LA", req_urgency: "E", service_id: item_id, active_status: true, del_status: false)[0]
      end
      price = lab_price.fee
      self.item_price = price

    elsif bill.confirmed_appointment.pre_appointment.appointment_type_id == "VC"
      if bill.confirmed_appointment.pre_appointment.req_urgency == "S"
        vc_price = ServiceFeeMaster.where(appt_type_id: "VC", req_urgency: "S", active_status: true, del_status: false)[0]
      elsif bill.confirmed_appointment.pre_appointment.req_urgency == "E"
        vc_price = ServiceFeeMaster.where(appt_type_id: "VC", req_urgency: "E", active_status: true, del_status: false)[0]
      end
      price = vc_price.fee
      self.item_price = price

    elsif bill.confirmed_appointment.pre_appointment.appointment_type_id == "HC"
      if bill.confirmed_appointment.pre_appointment.req_urgency == "S"
        hc_price = ServiceFeeMaster.where(appt_type_id: "HC", req_urgency: "S", active_status: true, del_status: false)[0]
      elsif bill.confirmed_appointment.pre_appointment.req_urgency == "E"
        hc_price = ServiceFeeMaster.where(appt_type_id: "HC", req_urgency: "E", active_status: true, del_status: false)[0]
      end
      price = hc_price.fee
      self.item_price = price

    elsif bill.confirmed_appointment.pre_appointment.appointment_type_id == "PC"
      if bill.confirmed_appointment.pre_appointment.req_urgency == "S"
        pc_price = ServiceFeeMaster.where(appt_type_id: "PC", req_urgency: "S", active_status: true, del_status: false)[0]
      elsif bill.confirmed_appointment.pre_appointment.req_urgency == "E"
        pc_price = ServiceFeeMaster.where(appt_type_id: "PC", req_urgency: "E", active_status: true, del_status: false)[0]
      end
      price = pc_price.fee
      self.item_price = price

    elsif bill.confirmed_appointment.pre_appointment.appointment_type_id == "PDHC"
      if bill.confirmed_appointment.pre_appointment.req_urgency == "S"
        pdhc_price = ServiceFeeMaster.where(appt_type_id: "PDHC", req_urgency: "S", active_status: true, del_status: false)[0]
      elsif bill.confirmed_appointment.pre_appointment.req_urgency == "E"
        pdhc_price = ServiceFeeMaster.where(appt_type_id: "PDHC", req_urgency: "E", active_status: true, del_status: false)[0]
      end
      price = pdhc_price.fee
      self.item_price = price

    elsif bill.confirmed_appointment.pre_appointment.appointment_type_id == "PDDP"
      if bill.confirmed_appointment.pre_appointment.req_urgency == "S"
        pddp_price = ServiceFeeMaster.where(appt_type_id: "PDDP", req_urgency: "S", active_status: true, del_status: false)[0]
      elsif bill.confirmed_appointment.pre_appointment.req_urgency == "E"
        pddp_price = ServiceFeeMaster.where(appt_type_id: "PDDP", req_urgency: "E", active_status: true, del_status: false)[0]
      end
      price = pddp_price.fee
      self.item_price = price

    elsif bill.confirmed_appointment.pre_appointment.appointment_type_id == "PDVC"
      if bill.confirmed_appointment.pre_appointment.req_urgency == "S"
        pdvc_price = ServiceFeeMaster.where(appt_type_id: "PDVC", req_urgency: "S", active_status: true, del_status: false)[0]
      elsif bill.confirmed_appointment.pre_appointment.req_urgency == "E"
        pdvc_price = ServiceFeeMaster.where(appt_type_id: "PDVC", req_urgency: "E", active_status: true, del_status: false)[0]
      end
      price = pdvc_price.fee
      self.item_price = price


    end
  end

end
