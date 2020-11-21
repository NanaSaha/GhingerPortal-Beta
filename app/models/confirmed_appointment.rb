class ConfirmedAppointment < ActiveRecord::Base
  validates :pre_appointment_id, presence: {message: "This field is required"}
  validates :provider_id, presence: {message: "Please select a provider"}, unless: :skip_validation_for_pds, unless: :skip_provider_validation_for_vc
  # , unless: :skip_time_validation, unless: :skip_provider_validation_for_vc
  
  validates :confirmed_date, presence: {message: "Please indicate date and time for the patient"}, unless: :skip_time_validation
  
  validates :suburb_id, presence: {message: "Please select a location"}, unless: :skip_validation_for_pds
  
  validates :doctor_id,  presence: {message: "Please select a doctor" }, if: :if_pd
   # validates :nurse_id, presence: {message: "Please select a nurse" }, if: :check_doc_n_nurse_field
  
  # unless: :skip_doctor_id_validation 

  # unless: :skip_doctor_id_validation 
  
  has_many :confirmed_conditions, foreign_key: :confirmed_appointment_id
  has_many :patient_med_records, foreign_key: :confirmed_appt_id
  has_many :lab_details, foreign_key: :confirmed_appt_id
  has_many :medication_details, foreign_key: :confirmed_appt_id
  has_many :patient_billing_infos, foreign_key: :appointment_id
  has_one :appointment_type, through: :pre_appointment
  has_one :request_category, through: :pre_appointment

  
  # has_many :person_contact_infos, through: :patients
   
  belongs_to :provider_master, class_name: "ProviderMaster", foreign_key: :provider_id
  belongs_to :pre_appointment, class_name: "PreAppointment", foreign_key: :pre_appointment_id
  belongs_to :suburb_master, class_name: "SuburbMaster", foreign_key: :suburb_id
  belongs_to :user, class_name: "User", foreign_key: :user_id
  belongs_to :doctor, class_name: "PersonInfo", foreign_key: :doctor_id
  belongs_to :patient, class_name: "PersonInfo", foreign_key: :patient_id
  belongs_to :nurse, class_name: "PersonInfo", foreign_key: :nurse_id 
  
  
   accepts_nested_attributes_for :confirmed_conditions, reject_if: proc { |attributes| attributes['condition_id'].blank? }, allow_destroy: true
   
   
   def if_pd
     pre_appointment.appointment_type_id == 'PD'
   end
   
    def skip_doctor_id_validation
        pre_appointment.appointment_type_id == 'PD' or pre_appointment.appointment_type_id == 'VC' or pre_appointment.appointment_type_id == 'HC' or pre_appointment.appointment_type_id == 'MD' 
    end
     
      
    def skip_validation_for_pds
      pre_appointment.appointment_type_id == 'VC' or pre_appointment.appointment_type_id == 'PC'  or pre_appointment.appointment_type_id == 'PD' or pre_appointment.appointment_type_id == 'PDDP' or pre_appointment.appointment_type_id == 'PDHC' or pre_appointment.appointment_type_id == 'PDVC'  
    end
    
    def skip_time_validation
      pre_appointment.appointment_type_id == 'MD' or pre_appointment.appointment_type_id == 'PDDP' or  pre_appointment.appointment_type_id == 'PD'
    end
    
    def skip_provider_validation_for_vc
       pre_appointment.appointment_type_id == 'VC' or pre_appointment.appointment_type_id == 'MD' or pre_appointment.appointment_type_id == 'HC' or pre_appointment.appointment_type_id == 'PC' or pre_appointment.appointment_type_id == 'PDVC'or pre_appointment.appointment_type_id == 'PDHC'or pre_appointment.appointment_type_id == 'PDDP' or pre_appointment.appointment_type_id == 'PD' or pre_appointment.appointment_type_id == 'LA'        
    end
    
    # def skip_time_validation_for_only_pd
      # pre_appointment.appointment_type_id == 'PD'
    # end
    
    # check if doctor or nurse field is empty
    # def check_doc_n_nurse_field
      # if pre_appointment.appointment_type_id == 'HC' and (self.doctor_id != '' or self.nurse_id != '')
#      
      # elsif
        # pre_appointment.appointment_type_id == 'PD' or pre_appointment.appointment_type_id == 'VC' or pre_appointment.appointment_type_id == 'HC' or pre_appointment.appointment_type_id == 'MD' and (self.doctor_id != '')
      # end
    # end

  def self.patient_search(patient)
    if patient
      full_name = patient.split(' ')
      first_name = full_name.last
      last_name = full_name.first
      joins(:patient).where('person_infos.person_type_id  =? AND (person_infos.surname iLIKE ? OR person_infos.other_names iLIKE ?)', "C", "%#{last_name}%", "%#{first_name}%")
    else
      all
    end
  end

  def self.doctor_search(doctor)
    if doctor
      full_name = doctor.split(' ')
      first_name = full_name.last
      last_name = full_name.first
      joins(:doctor).where('person_infos.person_type_id  =? AND (person_infos.surname iLIKE ? OR person_infos.other_names iLIKE ?)', "D", "%#{last_name}%", "%#{first_name}%")
    else
      all
    end
  end

  def self.nurse_search(nurse)
    if nurse
      full_name = nurse.split(' ')
      first_name = full_name.last
      last_name = full_name.first
      joins(:nurse).where('person_infos.person_type_id  =? AND (person_infos.surname iLIKE ? OR person_infos.other_names iLIKE ?)', "N", "%#{last_name}%", "%#{first_name}%")
    else
      all
    end
  end
    
    
   
    def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{ appointment_type patient provider category complaint_desc confirmed_date comment  status source created_at }

        if page and perpage

            page = page.to_i
            perpage= perpage.to_i

            off = perpage*(page - 1)

            CSV.generate(options) do |csv|
                csv << column_names
               limit(perpage).offset(off).each do |request|
                    row = request.attributes.values_at(*column_names) 
                    row[0] = request.pre_appointment.appointment_type.title
                    full_name = request.pre_appointment.person_info.surname + " "+ request.pre_appointment.person_info.other_names
                    full_sanitizer = Rails::Html::FullSanitizer.new
                    row[1] = full_name
                    row[2] = request.provider_master.provider_name if request.provider_master
                    row[3] = request.pre_appointment.request_category.category if request.pre_appointment.request_category
                    row[4] = full_sanitizer.sanitize(request.complaint_desc) if request.complaint_desc
                    row[6] = full_sanitizer.sanitize(request.comment) if request.comment
                    row[7] = request.active_status ? 'Active' : 'Inactive'
                    source = request.pre_appointment.src
                    if source == 'PTL'
                       row[8] = 'Portal'
                    elsif source == 'APP'
                       row[8] = 'Mobile App'
                    elsif source == 'USS'
                      row[8] = 'USSD'
                    elsif source == 'WEB'
                      row[8] = 'Web Access'
                    end
                    
                    csv << row
                end
            end

        else
            CSV.generate(options) do |csv|
                csv << column_names
               all.each do |request|
                    row = request.attributes.values_at(*column_names) 
                    row[0] = request.pre_appointment.appointment_type.title
                    full_name = request.pre_appointment.person_info.surname + " "+ request.pre_appointment.person_info.other_names
                    full_sanitizer = Rails::Html::FullSanitizer.new
                    row[1] = full_name
                    row[2] = request.provider_master.provider_name if request.provider_master
                    row[3] = request.pre_appointment.request_category.category if request.pre_appointment.request_category
                    row[4] = full_sanitizer.sanitize(request.complaint_desc) if request.complaint_desc
                    row[6] = full_sanitizer.sanitize(request.comment) if request.comment
                    row[7] = request.active_status ? 'Active' : 'Inactive'
                    source = request.pre_appointment.src
                    if source == 'PTL'
                       row[8] = 'Portal'
                    elsif source == 'APP'
                       row[8] = 'Mobile App'
                    elsif source == 'USS'
                      row[8] = 'USSD'
                    elsif source == 'WEB'
                      row[8] = 'Web Access'
                    end
                    
                    csv << row
                end
            end
        end

    end
    
    
    
   

end
