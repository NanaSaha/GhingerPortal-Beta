class CountryMaster < ActiveRecord::Base
    validates :country_name, presence: {message: "Please Enter a country name"}
    # validates :comment, presence: {message: "Please"}
     # before_save :upcase_fields
     before_save :titler
     has_many :region_masters, foreign_key: :country_id
     belongs_to :users, class_name: "User", foreign_key: :user_id 
    
    # def upcase_fields
     # self.country_name.upcase!
    # end  
    
    def titler
      str_list = self.country_name.split
  
      self.country_name = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
 
  
   # def self.to_csv(options = {})
       # attributes = %w{country_name comment}
      # CSV.generate(options) do |csv|
      # csv << attributes 
#       
      # all.each do |country|
        # csv << country.attributes.values_at(*attributes)
      # end     
    # end
  # end
  
  
  def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{country_name comment status created_at }

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