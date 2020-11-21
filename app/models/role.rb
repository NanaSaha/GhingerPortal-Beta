class Role < ActiveRecord::Base
    validates :name, presence: {message: "Please enter a role"}
    before_save :titler
    
    
    # attr_accessible :name
    
    has_many :users
    has_and_belongs_to_many :permissions
    
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
    
    def titler
      str_list = self.name.split
  
      self.name = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
    end
    
    
    
    def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{ name comment active_status created_at }

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
