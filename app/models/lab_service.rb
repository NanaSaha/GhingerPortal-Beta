class LabService < ActiveRecord::Base
    validates :title, presence: {message: "Please enter a lab service"}
    validates :price, presence: {message: "Please enter the price of the service"}
    before_save :titler, :money_formatter
    
    
    has_many :lab_details, foreign_key: :lab_service_id
    has_many :service_fee_masters, foreign_key: :service_id

    
   def titler
      str_list = self.title.split
       self.title = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
   
   
   def money_formatter
      price_tag = self.price
      self.price = sprintf("%.2f", price_tag.to_f)
   end
   
   
   def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{ title price comment active_status created_at }

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
