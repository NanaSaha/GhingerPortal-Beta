class SubscriptionNewMain < ActiveRecord::Base
    attr_accessor :payment_types, :networks, :mobile_number,:card_name,:voucher
    belongs_to :person_info, class_name: "PersonInfo", foreign_key: :doc_id
    has_many :subscription_remarks, class_name: "SubscriptionRemark", foreign_key: :sub_id
    has_many :subs_payments, class_name: "SubsPayment", foreign_key: :subscription_id


    def self.subscription_search(value)
   
        sql_arr = ""
       
       if value.strip == ""
        ""  
       else
      value = "'%#{value}%'"
       
       
       name = SubscriptionNewMain.where("LOWER(sub_name) LIKE LOWER(#{value})").last 
       
       logger.info "sub_name  Value :: #{name}"
       
     
       if name
     
        sql_arr << "subscription_new_mains.sub_name LIKE '%#{name.sub_name}%'"
    
       elsif  !name
       logger.info "----------------------------- wrong sub_name------------------------" 
        
        sql_arr << ""
        
      logger.info "Sql Value :: #{sql_arr}"
        end
      end
      sql_arr
      
      
    end


    
    def self.search_date(start="",ended="")
        if not start.blank? and not ended.blank?
            " subscription_new_mains.created_at BETWEEN '#{start} 00:00:00.0' AND '#{ended} 23:59:59.0' "
        elsif not start.blank?
            " subscription_new_mains.created_at > '#{start} 00:00:00.0' "
        elsif not ended.blank?
            " subscription_new_mains.created_at < '#{ended} 23:59:59.0' "
        else
            ""
        end
    end



    def self.fullname_search(value)
   
        sql_arr = ""
       
       if value.strip == ""
        ""  
       else
      value = "'%#{value}%'"
       
       
       name = SubscriptionNewMain.where("LOWER(f_name) LIKE LOWER(#{value})").last 
       
       logger.info "f_name  Value :: #{name}"
       
     
       if name
     
        sql_arr << "subscription_new_mains.f_name LIKE '%#{name.f_name}%'"
    
       elsif  !name
       logger.info "----------------------------- wrong f_name------------------------" 
        
        sql_arr << ""
        
      logger.info "Sql Value :: #{sql_arr}"
        end
      end
      sql_arr
      
      
    end



    def self.status_search(value)


         if value == "1"
            @state = 1
          elsif value == "0"
            @state = 0
          end
   
        sql_arr = ""
       
       if value.strip == ""
        ""  
       else
      value = "'%#{value}%'"


       name = SubscriptionNewMain.where(paid_status: @state).last 
       
       logger.info "paid_status  Value :: #{name}"
       
     
       if name
     
        sql_arr << "subscription_new_mains.paid_status = #{name.paid_status}"
    
       elsif  !name
       logger.info "----------------------------- wrong paid_status------------------------" 
        
        sql_arr << ""
        
      logger.info "Sql Value :: #{sql_arr}"
        end
      end
      sql_arr
      
      
    end














  
end
