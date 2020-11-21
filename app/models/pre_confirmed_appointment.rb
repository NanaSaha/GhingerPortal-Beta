class PreConfirmedAppointment < ActiveRecord::Base
  validates :date_time, presence: {message: "Please provide appointment date and time"}
  
  belongs_to :pre_appointment, class_name: "PreAppointment", foreign_key: :pre_appointment_id
  belongs_to :doctor, class_name: "PersonInfo", foreign_key: :doctor_id
  belongs_to :nurse, class_name: "PersonInfo", foreign_key: :nurse_id
  has_one :appointment_type, through: :pre_appointment


  belongs_to :patient, class_name: "PersonInfo", foreign_key: :patient_id

  has_many :decline_comments, foreign_key: :pre_confirmed_appointment_id


  def self.patient_search(patient)
    if patient
      full_name = patient.split(' ')
      first_name = full_name.last
      last_name =  full_name.first
      joins(:patient, :pre_appointment).where('person_infos.person_type_id =? AND ( person_infos.surname iLIKE ? OR person_infos.other_names iLIKE ? )', 'C', "%#{last_name}%", "%#{first_name}%" )
    else
      all
    end
  end

  def self.doctor_search(doctor)
    if doctor
      full_name = doctor.split(' ')
      first_name = full_name.last
      last_name = full_name.first
      joins(:doctor, :pre_appointment).where('person_infos.person_type_id  =? AND (person_infos.surname iLIKE ? OR person_infos.other_names iLIKE ?)', "D", "%#{last_name}%", "%#{first_name}%")
    else
      all
    end
  end

  def self.nurse_search(nurse)
    if nurse
      full_name = nurse.split(' ')
      first_name = full_name.last
      last_name = full_name.first
      joins(:nurse, :pre_appointment).where('person_infos.person_type_id  =? AND (person_infos.surname iLIKE ? OR person_infos.other_names iLIKE ?)', "N", "%#{last_name}%", "%#{first_name}%")
    else
      all
    end
  end
  
end
