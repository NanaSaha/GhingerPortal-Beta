class SpecialtyMaster < ActiveRecord::Base
   validates :title, presence: {message: "Please enter a specialty"}
    before_save :titler
    before_save :titler_alias
   
    has_many :person_info_extras
    has_many :registrations, class_name: "Registration", foreign_key: :specialty_id
    
   
    def titler
      str_list = self.title.split
  
      self.title = str_list.map { |word| word.capitalize
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
        column_names = %w{ title alias comment active_status created_at }

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
