class Permission < ActiveRecord::Base
  
  
  # filter by class
  def self.subject_class_search(subject_class)   
     subject_class = "%#{subject_class}%"
    where('subject_class LIKE ?', subject_class) 
  end
  
   def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{ subject_class action, name description active_status created_at }

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
