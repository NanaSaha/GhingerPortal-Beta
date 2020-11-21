 class RegionMaster < ActiveRecord::Base
  validates :region_state_name, presence: {message: "Please Enter a region or state name"}
  validates :country_id, presence: {message: "Please select a country"}
  
  # before_save :upcase_fields
  before_save :titler
  
  belongs_to :country_master, class_name: "CountryMaster", foreign_key: :country_id
  belongs_to :user, class_name: "User", foreign_key: :user_id  
  has_many :city_town_masters, foreign_key: :region_id
  
  
  # def upcase_fields
      # self.region_state_name.upcase!
    # end
    
  def titler
      str_list = self.region_state_name.split
  
      self.region_state_name = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
 
  
  def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{region_state_name country comment status created_at }

        if page and perpage

            page = page.to_i
            perpage= perpage.to_i

            off = perpage*(page - 1)

            CSV.generate(options) do |csv|
                csv << column_names
               limit(perpage).offset(off).each do |request|
                    row = request.attributes.values_at(*column_names) 
                    row[1] = request.country_master.country_name
                    row[3] = request.active_status ? 'Active' : 'Inactive'
                    csv << row
                end
            end

        else
            CSV.generate(options) do |csv|
                csv << column_names
               all.each do |request|
                    row = request.attributes.values_at(*column_names) 
                    row[1] = request.country_master.country_name
                    row[3] = request.active_status ? 'Active' : 'Inactive'
                    csv << row
                end
            end
        end

    end
  
   
  
  
end
