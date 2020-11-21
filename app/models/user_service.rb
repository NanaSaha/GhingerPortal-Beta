class UserService < ActiveRecord::Base
  validates :service_desc, presence: {message: "Please enter a service"}
  before_save :titler
  before_save :titler_alias
  
  has_many :engaged_user_services
  
  
 
  
   def titler
      str_list = self.service_desc.split
  
      self.service_desc = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
  end
  
  def titler_alias
      str_list = self.service_alias.split
  
      self.service_alias = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
  end
  
  
   def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{ service_desc service_alias comment active_status created_at }

        if page and perpage

            page = page.to_i
            perpage= perpage.to_i

            off = perpage*(page - 1)

            CSV.generate(options) do |csv|
                csv << column_names
               limit(perpage).offset(off).each do |request|
                    csv << request.attributes.values_at(*column_names)
                end
            end

        else
            CSV.generate(options) do |csv|
                csv << column_names
               all.each do |request|
                    csv << request.attributes.values_at(*column_names)
                end
            end
        end

    end
  
  
  
end
