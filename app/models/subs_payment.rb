class SubsPayment < ActiveRecord::Base
    belongs_to :subscription_new_main, class_name: "SubscriptionNewMain", foreign_key: :subscription_id




    def self.transaction_search(value)
   
        sql_arr = ""
       
       if value.strip == ""
        ""  
       else
      value = "'%#{value}%'"
       
       
       name = SubsPayment.where("LOWER(transaction_id) LIKE LOWER(#{value})").last 
       
       logger.info "transaction_id  Value :: #{name}"
       
     
       if name
     
        sql_arr << "subs_payments.transaction_id LIKE '%#{name.transaction_id}%'"
    
       elsif  !name
       logger.info "----------------------------- wrong transaction_id------------------------" 
        
        sql_arr << ""
        
      logger.info "Sql Value :: #{sql_arr}"
        end
      end
      sql_arr
      
      
    end
    

    def self.search_date(start="",ended="")
        if not start.blank? and not ended.blank?
            " subs_payments.created_at BETWEEN '#{start} 00:00:00.0' AND '#{ended} 23:59:59.0' "
        elsif not start.blank?
            " subs_payments.created_at > '#{start} 00:00:00.0' "
        elsif not ended.blank?
            " subs_payments.created_at < '#{ended} 23:59:59.0' "
        else
            ""
        end
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


      name = SubsPayment.where(trans_status: @state).last 
      
      logger.info "trans_status  Value :: #{name}"
      
    
      if name
    
       sql_arr << "subs_payments.trans_status = #{name.trans_status}"
   
      elsif  !name
      logger.info "----------------------------- wrong trans_status------------------------" 
       
       sql_arr << ""
       
     logger.info "Sql Value :: #{sql_arr}"
       end
     end
     sql_arr
     
     
   end

end
