class ProviderMaster < ActiveRecord::Base
  # validates :provider_name, presence: {message: "Please Enter a service provider name"}
  # validates :provider_type_id, presence: {message: "Please select a service provider type"}
  before_save :titler
  before_save :titler_alias
  
  
  belongs_to :service_prov_type, class_name: "ServiceProvType", foreign_key: :provider_type_id
  belongs_to :user, class_name: "User", foreign_key: :user_id
  
  has_many :provider_services
  has_many :service_prov_extra_infos, foreign_key: :service_prov_id
  has_many :provider_engaged_users, foreign_key: :provider_id
  has_many :pre_appointments 
  has_many :pre_appointments
  has_many :confirmed_appointments, foreign_key: :provider_id
  # has_and_belongs_to_many :suburbs
  has_many :suburb_masters, :through => :service_prov_extra_infos
  
  
  accepts_nested_attributes_for :service_prov_extra_infos, allow_destroy: true

  # def comment
    # self[:comment].html_safe if self[:comment]
  # end
  
    # def upcase_fields
      # self.provider_name.upcase!
      # self.alias.upcase!
    # end
    
    def titler
      str_list = self.provider_name.split
  
      self.provider_name = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
   
   def titler_alias
      str_list = self.alias.split
  
      self.alias = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
   
   def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{provider_name alias facility_type comment status created_at }

        if page and perpage

            page = page.to_i
            perpage= perpage.to_i

            off = perpage*(page - 1)

            CSV.generate(options) do |csv|
                csv << column_names
               limit(perpage).offset(off).each do |request|
                    row = request.attributes.values_at(*column_names) 
                    row[2] = request.service_prov_type.service_prov_type_title
                    row[4] = request.active_status ? 'Active' : 'Inactive'
                    csv << row
                end
            end

        else
            CSV.generate(options) do |csv|
                csv << column_names
               all.each do |request|
                    row = request.attributes.values_at(*column_names) 
                    row[2] = request.service_prov_type.service_prov_type_title
                    row[4] = request.active_status ? 'Active' : 'Inactive'
                    csv << row
                end
            end
        end

    end
    

end
