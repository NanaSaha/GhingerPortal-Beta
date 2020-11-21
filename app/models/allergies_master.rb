class AllergiesMaster < ActiveRecord::Base
   #attr_accessor :allergy_ids
  validates :title, presence: {message: "Please enter an allergy"}
  before_save :titler
  
  
  has_many :requester_allergies, foreign_key: :allergy_id
  has_many :pre_appointments, through: :requester_allergies
  
  
  def titler
      str_list = self.title.split
  
      self.title = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
  end
  
  def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{ title comment active_status created_at }

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
