class ConfirmedPersonalDoctorService < ActiveRecord::Base
  validates :doctor_id, presence: {message: "Please select a doctor"}
  validates :patient_id, presence: {message: "Please select a patient"}
  validates :suburb_id, presence: {message: "Please select a location"} 
  
  belongs_to :doctor, class_name: "PersonInfo", foreign_key: :doctor_id
  belongs_to :patient, class_name: "PersonInfo", foreign_key: :patient_id
  belongs_to :pre_appointment, class_name: "PreAppointment", foreign_key: :pre_appointment_id
  belongs_to :suburb_master, class_name: "SuburbMaster", foreign_key: :suburb_id 
  belongs_to :appointment_type, class_name: 'AppointmentType', foreign_key: :appointment_type_id
  belongs_to :user, class_name: "User", foreign_key: :user_id
  
  has_many :pds_patient_prev_med_histories, foreign_key: :confirmed_pds_id
   
   # filter by doctor
  def self.doctor_search(doctor)   
     doctor = "%#{doctor.capitalize}%"
     joins(:doctor).where('person_infos.surname LIKE?', doctor) 
  end
  
  # filter by patient
  def self.patient_search(patient)
     patient = "%#{patient.capitalize}%"
     joins(:patient).where('person_infos.surname LIKE ?', patient)
  end
  
   # filter by location
  def self.location_search(location)
     location = "%#{location.capitalize}%"
     joins(:suburb_master).where('suburb_masters.suburb_name LIKE ?', location)
  end
   
  # filter by date
  def self.search_date(start = nil, ended = nil)
    if start && ended
      where(created_at: "#{start}".."#{ended}")
    else
      all
    end
  end
  
  
  # def self.search_date(start, ended)
      # where(created_at: "#{start} 00:00:00".."#{ended} 23:59:59")
  # end
  
   def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{ doctor patient appointment_type comment status source created_at }

        if page and perpage

            page = page.to_i
            perpage= perpage.to_i

            off = perpage*(page - 1)

            CSV.generate(options) do |csv|
                csv << column_names
               limit(perpage).offset(off).each do |request|
                    full_sanitizer = Rails::Html::FullSanitizer.new
                    row = request.attributes.values_at(*column_names) 
                    row[0] = request.doctor.surname  + " " + request.doctor.other_names if request.doctor
                    row[1] = request.patient.surname + " " + request.patient.other_names if request.patient
                    row[2] = request.appointment_type.title if request.appointment_type
                    row[3] = full_sanitizer.sanitize(request.comment) if request.comment
                    row[4] = request.active_status ? 'Active' : 'Inactive'
                    source = request.pre_appointment.src
                    if source == 'PTL'
                       row[5] = 'Portal'
                    elsif source == 'APP'
                       row[5] = 'Mobile App'
                    elsif source == 'USS'
                      row[5] = 'USSD'
                    elsif source == 'WEB'
                      row[5] = 'Web Access'
                    end
                    
                    csv << row
                end
            end

        else
            CSV.generate(options) do |csv|
                csv << column_names
               all.each do |request|
                    full_sanitizer = Rails::Html::FullSanitizer.new
                    row = request.attributes.values_at(*column_names) 
                    row[0] = request.doctor.surname  + " " + request.doctor.other_names if request.doctor
                    row[1] = request.patient.surname + " " + request.patient.other_names if request.patient
                    row[2] = request.appointment_type.title if request.appointment_type
                    row[3] = full_sanitizer.sanitize(request.comment) if request.comment
                    row[4] = request.active_status ? 'Active' : 'Inactive'
                    source = request.pre_appointment.src
                    if source == 'PTL'
                       row[5] = 'Portal'
                    elsif source == 'APP'
                       row[5] = 'Mobile App'
                    elsif source == 'USS'
                      row[5] = 'USSD'
                    elsif source == 'WEB'
                      row[5] = 'Web Access'
                    end
                    
                    csv << row
                end
            end
        end

    end
  
   
   
end
