class ProfesionalGroup < ActiveRecord::Base
    validates :group_name, presence: {message: "Please enter a professional group"}
    before_save :titler
    
    has_many :person_info_extras
    has_many :registrations, class_name: "Registration", foreign_key: :specialty_id
    
    
    
    def titler
      str_list = self.group_name.split
  
      self.group_name = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
    end
    
    def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{ group_name comment active_status created_at }

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
