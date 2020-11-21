class ConditionMaster < ActiveRecord::Base
 validates :condition_name, presence: {message: "Please enter a condition"}
  before_save :titler
  
  def titler
      str_list = self.condition_name.split
  
      self.condition_name = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
  end
  
  def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{ condition_name comment active_status created_at }

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
