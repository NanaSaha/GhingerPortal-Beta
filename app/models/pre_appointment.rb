class PreAppointment < ActiveRecord::Base
   attr_accessor :skip_callbacks
   before_save :titler, unless: :skip_validation_for_pds
   
   skip_callback :save, :before, :titler, if: :skip_callbacks
   
   validates :suburb_id, presence: {message: "Please select a location"}, unless: :skip_validation_for_pds
   
   validates :provider_id, presence: {message: "Please select a provider from the menu"}, unless: :skip_validation_for_pds, unless: :skip_provider_validation_for_vc
   # unless:  :skip_validation_for_pds, :skip_provider_validation_for_vc 
  
   validates :requester_id, presence: {message: "Please previde a requester"}
   validates :requester_cat, presence: {message: "Please select a request category"}
   validates :appointment_type_id, presence: {message: "Please select an appointment type"}
   validates :proposed_date, presence: {message: "Please provide a date and time for your appointment"}, unless: :skip_time_validation
   validates :req_urgency, presence: {message: "Please select a request urgency type"}
  
      
  belongs_to :provider_master, class_name: "ProviderMaster", foreign_key: :provider_id
  belongs_to :person_info, class_name: "PersonInfo", foreign_key: :requester_id
  belongs_to :request_category, class_name: "RequestCategory", foreign_key: :requester_cat
  belongs_to :appointment_type, class_name: "AppointmentType", foreign_key: :appointment_type_id
  belongs_to :suburb_master, class_name: "SuburbMaster", foreign_key: :suburb_id
  belongs_to :request_urgency, class_name: "RequestUrgency", foreign_key: :req_urgency
  
  
  
  has_many :requester_allergies, foreign_key: :self_id 
  has_many :confirmed_appointments, foreign_key: :pre_appointment_id
  has_many :lab_details, foreign_key: :pre_appointment_id
  has_many :lab_detail_images, foreign_key: :pre_appointment_id
  has_many :confirmed_personal_doctor_services, foreign_key: :pre_appointment_id
  has_many :pre_confirmed_appointments, foreign_key: :pre_appointment_id
  
  has_one :registration, through: :person_info
  
  accepts_nested_attributes_for :lab_details, reject_if: proc { |attributes| attributes['lab_service_id'].blank? }, allow_destroy: true
  accepts_nested_attributes_for :lab_detail_images, reject_if: proc { |attributes| attributes['image'].blank? }, allow_destroy: true
  
  
  
  
   def titler
      str_list = self.beneficiary_name.split
  
      self.beneficiary_name = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
   
   
   def skip_validation_for_pds
      self.appointment_type_id == 'VC' or self.appointment_type_id == 'PC'  or self.appointment_type_id == 'PD' or self.appointment_type_id == 'DP' or self.appointment_type_id == 'PDHC' or self.appointment_type_id == 'PDVC' or self.appointment_type_id == 'PDDP'
   end
   
   def skip_provider_validation_for_vc
       self.appointment_type_id == 'VC' or self.appointment_type_id == 'MD' or self.appointment_type_id == 'HC' or self.appointment_type_id == 'PC' or self.appointment_type_id == 'PDVC'or self.appointment_type_id == 'PDHC'or self.appointment_type_id == 'DP' or self.appointment_type_id == 'PD' or self.appointment_type_id == 'LA' or self.appointment_type_id == 'PDDP'       
   end
   
   def skip_time_validation
      self.appointment_type_id == 'MD' or self.appointment_type_id == 'PDDP' or  self.appointment_type_id == 'PD'
   end
   
   def skip_doctor_id_validation
       self.appointment_type_id == 'VC' or self.appointment_type_id == 'HC'
   end


   def self.patient_search(patient)
     if patient
       full_name = patient.split(' ')
       first_name = full_name.last
       last_name = full_name.first
       joins(:person_info).where('person_infos.person_type_id  =? AND (person_infos.surname iLIKE ? OR person_infos.other_names iLIKE ?)', "C", "%#{last_name}%", "%#{first_name}%")
     else
       all
     end
   end

   def self.doctor_search(doctor)
     if doctor
       full_name = doctor.split(' ')
       first_name = full_name.last
       last_name = full_name.first
       joins(:person_info).where('person_infos.person_type_id  =? AND (person_infos.surname iLIKE ? OR person_infos.other_names iLIKE ?)', "D", "%#{last_name}%", "%#{first_name}%")
     else
       all
     end
   end

   def self.nurse_search(nurse)
     if nurse
       full_name = nurse.split(' ')
       first_name = full_name.last
       last_name = full_name.first
       joins(:person_info).where('person_infos.person_type_id  =? AND (person_infos.surname iLIKE ? OR person_infos.other_names iLIKE ?)', "N", "%#{last_name}%", "%#{first_name}%")
     else
       all
     end
   end
   
   
   
   def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{provider requester category beneficiary_name appointment_type proposed_date complaint prev_medical_history urgency comment status source created_at }

        if page and perpage

            page = page.to_i
            perpage= perpage.to_i

            off = perpage*(page - 1)

            CSV.generate(options) do |csv|
                csv << column_names
               limit(perpage).offset(off).each do |request|
                    row = request.attributes.values_at(*column_names) 
                    row[0] = request.provider_master.provider_name if request.provider_master
                    full_name = request.person_info.surname + " "+ request.person_info.other_names
                    full_sanitizer = Rails::Html::FullSanitizer.new
                    row[1] = full_name
                    row[2] = request.request_category.category if request.request_category
                    row[4] = request.appointment_type.title
                    row[6] = full_sanitizer.sanitize(request.complaint_desc) if request.complaint_desc
                    row[7] = full_sanitizer.sanitize(request.prev_medical_history) if request.prev_medical_history
                    row[8] = request.request_urgency.urgency if request.request_urgency
                    row[9] = full_sanitizer.sanitize(request.comment) if request.comment
                    row[10] = request.active_status ? 'Active' : 'Inactive'
                    source = request.src
                    if source == 'PTL'
                       row[11] = 'Portal'
                    elsif source == 'APP'
                       row[11] = 'Mobile App'
                    elsif source == 'USS'
                      row[11] = 'USSD'
                    elsif source == 'WEB'
                      row[11] = 'Web Access'
                    end
                    
                    csv << row
                end
            end

        else
            CSV.generate(options) do |csv|
                csv << column_names
               all.each do |request|
                    row = request.attributes.values_at(*column_names) 
                    row[0] = request.provider_master.provider_name if request.provider_master
                    full_name = request.person_info.surname + " "+ request.person_info.other_names
                    full_sanitizer = Rails::Html::FullSanitizer.new
                    row[1] = full_name
                    row[2] = request.request_category.category if request.request_category
                    row[4] = request.appointment_type.title
                    row[6] = full_sanitizer.sanitize(request.complaint_desc) if request.complaint_desc
                    row[7] = full_sanitizer.sanitize(request.prev_medical_history) if request.prev_medical_history
                    row[8] = request.request_urgency.urgency if request.request_urgency
                    row[9] = full_sanitizer.sanitize(request.comment) if request.comment
                    row[10] = request.active_status ? 'Active' : 'Inactive'
                    source = request.src
                    if source == 'PTL'
                       row[11] = 'Portal'
                    elsif source == 'APP'
                       row[11] = 'Mobile App'
                    elsif source == 'USS'
                      row[11] = 'USSD'
                    elsif source == 'WEB'
                      row[11] = 'Web Access'
                    end
                    csv << row
                end
            end
        end

    end
   
   
  
  
end
