class PersonInfo < ActiveRecord::Base
    
    validates :other_names, presence: {message: "Please enter a othername(s)"}
    # format: { with: /\A[a-zA-Z]+\z/, message: "Othername(s) must be letters only!" }
    validates :surname, presence: {message: "Please enter a surname"}
    # format: { with: /\A[a-zA-Z]+\z/, message: "Surname must be letters only!" }
    validates :person_type_id, presence: {message: "Please select a player type"}
    # validates :dob, presence: {message: "Please enter your date of birth"}
     
     before_save :titler_surname
     before_save :titler_other_names
  
  
    has_many :provider_engaged_users
    has_many :person_contact_infos, class_name: "PersonContactInfo", foreign_key: :person_id
    has_many :person_info_extras
    has_many :users, foreign_key: :person_id
    has_many :pre_appointments
    has_many :engaged_user_services
    has_many :doctors, foreign_key: :doctor_id
    has_many :nurses, foreign_key: :nurse_id
    has_many :patients, class_name: "PersonInfo", foreign_key: :patient_id
    has_many :requester_allergies, foreign_key: :requester_id
    
    has_many :referals, foreign_key: :refered_by

    has_many :pre_confirmed_appointments, foreign_key: :patient_id


    # has_many :suburb_masters, :through => :person_contact_infos
    
    
    
    
    belongs_to :person_type_master, class_name: "PersonTypeMaster", foreign_key: :person_type_id   
    belongs_to :registration, class_name: "Registration", foreign_key: :reg_id
    belongs_to :user, class_name: "User", foreign_key: :user_id
    
     #has_and_belongs_to_many :permissions
  
    accepts_nested_attributes_for :person_contact_infos, allow_destroy: true
    accepts_nested_attributes_for :users,  allow_destroy: true
    
    
    # def upcase_fields
      # self.surname.upcase!
      # self.other_names.upcase!
    # end
    
    def titler_surname
      str_list = self.surname.split
  
      self.surname = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
   
   def titler_other_names
      str_list = self.other_names.split
  
      self.other_names = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end


    def self.patient_search(patient)
        if patient
          full_name = patient.split(' ')
          first_name = full_name.last
          last_name = full_name.first
          joins(:person_type_master).where('person_type_masters.ref_id  =? AND (person_infos.surname iLIKE ? OR person_infos.other_names iLIKE ?)', "C", "%#{last_name}%", "%#{first_name}%")
        else
          all
        end
    end

    def self.doctor_search(doctor)
      if doctor
          full_name = doctor.split(' ')
          first_name = full_name.last
          last_name = full_name.first
        joins(:person_type_master).where('person_type_masters.ref_id  =? AND (person_infos.surname iLIKE ? OR person_infos.other_names iLIKE ?)', "D", "%#{last_name}%", "%#{first_name}%")
      else
        all
      end
    end


    def self.nurse_search(nurse)
      if nurse
          full_name = nurse.split(' ')
          first_name = full_name.last
          last_name = full_name.first
        joins(:person_type_master).where('person_type_masters.ref_id  =? AND (person_infos.surname iLIKE ? OR person_infos.other_names iLIKE ?)', "N", "%#{last_name}%", "%#{first_name}%")
      else
        all
      end
    end

    def self.pharmacist_search(pharmacist)
      if pharmacist
          full_name = pharmacist.split(' ')
          first_name = full_name.last
          last_name = full_name.first
        joins(:person_type_master).where('person_type_masters.ref_id  =? AND (person_infos.surname iLIKE ? OR person_infos.other_names iLIKE ?)', "P", "%#{last_name}%", "%#{first_name}%")
      else
        all
      end
    end

    def self.laboratorist_search(laboratorist)
      if laboratorist
          full_name = laboratorist.split(' ')
          first_name = full_name.last
          last_name = full_name.first
        joins(:person_type_master).where('person_type_masters.ref_id  =? AND (person_infos.surname iLIKE ? OR person_infos.other_names iLIKE ?)', "L", "%#{last_name}%", "%#{first_name}%")
      else
        all
      end
    end

   
   
    def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{surname other_names person_type comment status created_at }

        if page and perpage

            page = page.to_i
            perpage= perpage.to_i

            off = perpage*(page - 1)

            CSV.generate(options) do |csv|
                csv << column_names
               limit(perpage).offset(off).each do |request|
                    row = request.attributes.values_at(*column_names) 
                    row[2] = request.person_type_master.user_type_title
                    row[4] = request.active_status ? 'Active' : 'Inactive'
                    csv << row
                end
            end

        else
            CSV.generate(options) do |csv|
                csv << column_names
               all.each do |request|
                    row = request.attributes.values_at(*column_names) 
                    row[2] = request.person_type_master.user_type_title
                    row[4] = request.active_status ? 'Active' : 'Inactive'
                    csv << row
                end
            end
        end

    end
   
   
end
