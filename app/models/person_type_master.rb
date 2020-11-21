class PersonTypeMaster < ActiveRecord::Base
  self.primary_key = "ref_id"
    # attr_accessor :user_type_title
  validates :user_type_title, presence: {message: "Please select a new user type"}
  before_save :titler
  
  
  has_many :person_infos, foreign_key: :person_type_id
  has_many :registration, foreign_key: :user_type
 
  def set_permissions(permissions)
    permissions.each do |id|
      permission = Permission.find(id)
      self.permissions << permission
      case permission.subject_class
      when "Part"
        case permission.action
        when "create"
          self.permissions << Permission.where(subject_class: "Drawing", action: "create")
        when "update"
          self.permissions << Permission.where(subject_class: "Drawing", action: ["update", "destroy"])
        end
      end
    end
  end
  
  
  
  
  
    def upcase_fields
      self.user_type_title.upcase!
    end
    
    def titler
      str_list = self.user_type_title.split
  
      self.user_type_title = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
    
end
