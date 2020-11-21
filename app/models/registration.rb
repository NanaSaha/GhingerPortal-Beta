class Registration < ActiveRecord::Base
  self.table_name = "registration"
  # attr_accessor :password_confirmation
  before_save :titler_surname
  before_save :titler_other_names
  # before_save { self.email = email.downcase }
  
  validates :email, email: {message: "Please enter a vaild email"}, uniqueness: true
  validates :surname, presence: {message: "Please Enter a surname"} #, format: { with: /\A[a-zA-Z]+\z/, message: "Surname must be letters only!" }
  # validates :surburb_id, presence: {message: "Please Provide your location"}
  validates :other_names, presence: {message: "Please Enter othername(s)"} #, format: { with: /\A[a-zA-Z]+\z/, message: "Othername(s) must be letters only!" }

  validates :mobile_number, presence: {message: "Please Enter a mobile number"}, uniqueness: true #, numericality: { message: "Mobile number must be integers only!" }
  validates :user_type, presence: {message: "Please select a user type"}

  validates :password, presence: {message: "Please chose a password"}

  
  
   
   validates_length_of :password, :minimum=>6, :message=>"password must be at least 6 characters"
  
   has_many :person_infos, foreign_key: :reg_id
  
   has_many :pre_appointments, through: :person_infos
   
   belongs_to :user, class_name: "User", foreign_key: :user_id
   belongs_to :person_type_master, class_name: 'PersonTypeMaster', foreign_key: :user_type
   belongs_to :specialty_master, class_name: "SpecialtyMaster", foreign_key: :specialty_id
   belongs_to :profesional_group, class_name: "ProfesionalGroup", foreign_key: :professional_group_id
   
   
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
   
   def check_has_specialty
      self.has_specialty == true
   end
  
   
   def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{surname other_names mobile_number telco src verified email user_type status created_at }

        if page and perpage

            page = page.to_i
            perpage= perpage.to_i

            off = perpage*(page - 1)

            CSV.generate(options) do |csv|
                csv << column_names
               limit(perpage).offset(off).each do |request|
                   row = request.attributes.values_at(*column_names)
                    source = request.src
                    if source == 'PTL'
                       row[4] = 'Portal'
                    elsif source == 'APP'
                       row[4] = 'Mobile App'
                    elsif source == 'USS'
                      row[4] = 'USSD'
                    elsif source == 'WEB'
                      row[4] = 'Web Access'
                    end 
                    row[5] = request.verified ? 'Confirmed' : 'Unconfirmed'
                    row[8] = request.person_type_master.user_type_title
                    row[9] = request.status ? 'Active' : 'Inactive'
                    csv << row
                end
            end

        else
            CSV.generate(options) do |csv|
                csv << column_names
               all.each do |request|
                   row = request.attributes.values_at(*column_names)
                    source = request.src
                    if source == 'PTL'
                       row[4] = 'Portal'
                    elsif source == 'APP'
                       row[4] = 'Mobile App'
                    elsif source == 'USS'
                      row[4] = 'USSD'
                    elsif source == 'WEB'
                      row[4] = 'Web Access'
                    end 
                    row[5] = request.verified ? 'Confirmed' : 'Unconfirmed'
                    row[8] = request.person_type_master.user_type_title
                    row[9] = request.status ? 'Active' : 'Inactive'
                    csv << row
                end
            end
        end

    end
   
   
end
  