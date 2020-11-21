class ServiceMaster < ActiveRecord::Base
  validates :title, presence: {message: "Please Enter a service name"}
  before_save :titler
  
  
  belongs_to :user, class_name: "User", foreign_key: :user_id
  
  has_many :provider_services
  # has_many :provider_masters, :through => :provider_services
  
  
  
    # def upcase_fields
      # self.title.upcase!
    # end
    
    
    def titler
      str_list = self.title.split
  
      self.title = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
    
   
   def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{title comment status created_at }

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
