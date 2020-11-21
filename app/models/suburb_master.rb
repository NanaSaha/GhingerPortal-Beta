class SuburbMaster < ActiveRecord::Base
  validates :suburb_name, presence: {message: "Please Enter a suburb name"}
  validates :city_town_id, presence: {message: "Please Select a town"}
  
  before_save :titler
  
  belongs_to :city_town_master, class_name: "CityTownMaster", foreign_key: :city_town_id
  belongs_to :user, class_name: "User", foreign_key: :user_id
  
  
  has_many :service_prov_extra_infos, foreign_key: :suburb_id
  # has_and_belongs_to_many :provider_masters
  has_many :provider_masters, :through => :service_prov_extra_infos
  has_many :pre_appointments, foreign_key: :suburb_id
  has_many :confirmed_appointments, foreign_key: :suburb_id
  has_many :person_contact_infos, foreign_key: :suburb_id
  has_many :confirmed_personal_doctor_services, foreign_key: :suburb_id
  
  # has_many :person_infos, :through => :person_contact_infos
  
    # def upcase_fields
      # self.suburb_name.upcase! 
    # end
    
    def titler
      str_list = self.suburb_name.split
  
      self.suburb_name = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
 
   
   def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{suburb_name town comment status created_at }

        if page and perpage

            page = page.to_i
            perpage= perpage.to_i

            off = perpage*(page - 1)

            CSV.generate(options) do |csv|
                csv << column_names
               limit(perpage).offset(off).each do |request|
                    row = request.attributes.values_at(*column_names) 
                    row[1] = request.city_town_master.city_town_name
                    row[3] = request.active_status ? 'Active' : 'Inactive'
                    csv << row
                end
            end

        else
            CSV.generate(options) do |csv|
                csv << column_names
               all.each do |request|
                    row = request.attributes.values_at(*column_names) 
                    row[1] = request.city_town_master.city_town_name
                    row[3] = request.active_status ? 'Active' : 'Inactive'
                    csv << row
                end
            end
        end

    end
 
 
 
 
    
end
