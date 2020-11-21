class Referal < ActiveRecord::Base
  
  before_save :titler_surname
  before_save :titler_other_names
  
  validates :surname, presence: {message: "Please Enter a surname"}
  validates :other_names, presence: {message: "Please Enter other name(s)"}
  # validates :dob, presence: {message: "Please Enter date of birth"}
  validates :contact, presence: {message: "Please Enter contact number"}
  
  
   belongs_to :person_info, class_name: "PersonInfo", foreign_key: :refered_by
   belongs_to :user, class_name: "User", foreign_key: :user_id
  
  
  def titler_surname
      str_list = self.surname.split
  
      self.surname = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
   
   def titler_other_names
      str_list = self.other_names.split
  
      self.other_names = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
   
   
   def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{ surname other_names contact created_at }

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
