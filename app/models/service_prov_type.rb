class ServiceProvType < ActiveRecord::Base
  validates :service_prov_type_title, presence: {message: "Please Enter a service provider type"}
  before_save :titler
  
  
  has_many :provider_masters
  
  belongs_to :user, class_name: "User", foreign_key: :user_id
  
  
  
    # def upcase_fields
      # self.service_prov_type_title.upcase!
    # end
    
    def titler
      str_list = self.service_prov_type_title.split
  
      self.service_prov_type_title = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
   
   
   def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{service_prov_type_title comment status created_at }

        if page and perpage

            page = page.to_i
            perpage= perpage.to_i

            off = perpage*(page - 1)

            CSV.generate(options) do |csv|
                csv << column_names
               limit(perpage).offset(off).each do |request|
                    row = request.attributes.values_at(*column_names) 
                    row[2] = request.active_status ? 'Active' : 'Inactive'
                    csv << row
                end
            end

        else
            CSV.generate(options) do |csv|
                csv << column_names
               all.each do |request|
                    row = request.attributes.values_at(*column_names) 
                    row[2] = request.active_status ? 'Active' : 'Inactive'
                    csv << row
                end
            end
        end

    end
    
    
end
