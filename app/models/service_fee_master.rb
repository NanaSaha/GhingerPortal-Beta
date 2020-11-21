class ServiceFeeMaster < ActiveRecord::Base
  before_save :set_service_to_nil_if_not_lab

  validates :appt_type_id, presence: {message: "Select appointment type"}
  validates_uniqueness_of :appt_type_id,:scope => :req_urgency, message: "The select req type for this appointment",
                          conditions: ->{where(active_status: true, del_status: false)}, unless: :if_lab
  validates :req_urgency, presence: {message: "Select request urgency"}

  validates :fee, presence: {message: "Enter service price"}
  validates :service_id, presence: {message: "Select lab service"}, if: :if_lab
            # :uniqueness => {:scope => :req_urgency, message: "The select req type for this service  is already set"}, if: :if_lab  #[:req_urgency, :appt_type_id]
  validates_uniqueness_of :service_id,
                          :scope => :req_urgency, message: "The select req type for this service",
                          conditions: ->{where(active_status: true, del_status: false)}, if: :if_lab

  belongs_to :appointment_type, class_name: "AppointmentType", foreign_key: :appt_type_id
  belongs_to :lab_service, class_name: "LabService", foreign_key: :service_id


  def if_lab
    self.appt_type_id == "LA"
  end

  def set_service_to_nil_if_not_lab
    if self.appt_type_id != "LA"
      self.service_id = nil
    end
  end


  def self.to_csv(options = {}, page=nil, perpage=nil)
    column_names = %w{appt_type service req_urgency price comment status created_at }

    if page and perpage

      page = page.to_i
      perpage= perpage.to_i

      off = perpage*(page - 1)

      CSV.generate(options) do |csv|
        csv << column_names
        limit(perpage).offset(off).each do |request|
          row = request.attributes.values_at(*column_names)
          row[0] = request.appointment_type.title
          if request.service_id.present?
            row[1] = request.lab_service.title
          else
            row[1] = "Not Applicable"
          end
          if request.req_urgency == "S"
            row[2] = "Standard"
          elsif request.req_urgency == "E"
            row[2] = "Express"
          end
          row[3] = request.fee.round(2)
          row[5] = request.active_status ? 'Active' : 'Inactive'
          csv << row
        end
      end

    else
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |request|
          row = request.attributes.values_at(*column_names)
          row[0] = request.appointment_type.title
          if request.service_id.present?
            row[1] = request.lab_service.title
          else
            row[1] = "Not Applicable"
          end
          if request.req_urgency == "S"
            row[2] = "Standard"
          elsif request.req_urgency == "E"
            row[2] = "Express"
          end
          row[3] = request.fee.round(2)
          row[5] = request.active_status ? 'Active' : 'Inactive'
          csv << row
        end
      end
    end

  end





end
