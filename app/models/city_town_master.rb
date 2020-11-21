class CityTownMaster < ActiveRecord::Base
  validates :city_town_name, presence: {message: "Please Enter a city or town name"}
  validates :region_id, presence: {message: "Please select a region"}
  before_save :titler
  
  
  belongs_to :region_master, class_name: "RegionMaster", foreign_key: :region_id
  belongs_to :user, class_name: "User", foreign_key: :user_id
  has_many :suburb_masters, foreign_key: :city_town_id
  
  
  
  
  # def upcase_fields
      # self.city_town_name.upcase!
  # end
  
   def titler
      str_list = self.city_town_name.split
  
      self.city_town_name = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
   
   
   def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{city_town_name region comment status created_at }

        if page and perpage

            page = page.to_i
            perpage= perpage.to_i

            off = perpage*(page - 1)

            CSV.generate(options) do |csv|
                csv << column_names
               limit(perpage).offset(off).each do |request|
                    row = request.attributes.values_at(*column_names) 
                    row[1] = request.region_master.region_state_name
                    row[3] = request.active_status ? 'Active' : 'Inactive'
                    csv << row
                end
            end

        else
            CSV.generate(options) do |csv|
                csv << column_names
               all.each do |request|
                    row = request.attributes.values_at(*column_names) 
                    row[1] = request.region_master.region_state_name
                    row[3] = request.active_status ? 'Active' : 'Inactive'
                    csv << row
                end
            end
        end

    end
  
   
   
  
  
end

