class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token

     require 'twilio-ruby'

  require 'json'
  require 'faraday'
  require 'openssl'
  require 'uri'
  require 'net/http'



   def sendmsg(phone,msg)

      account_sid = ''
      auth_token = ''
      @client = Twilio::REST::Client.new(account_sid, auth_token)
      
      from = 'Ghinger' # Your Twilio number
      to = validatePhoneNumber(phone) # Your mobile phone number
      @client.messages.create(
      from: from,
      to: to,
      body: msg
      )
      
      
      end

      CTRYCODE = '+233'.freeze
      CTRYCODES = '+'.freeze
      
      def validatePhoneNumber(mobile_number)
   puts "THE PHONE NUMBER IS "
   wildcard_search = "#{mobile_number}"
  puts  wildcard_search
   puts "THE PHONE NUMBER LENGHT"
  puts  wildcard_search.length
 puts "--------------------------"
   if wildcard_search[0..2]=='233' && wildcard_search.length==12
     puts wildcard_search=CTRYCODE+"#{wildcard_search[3..wildcard_search.length]}"
   elsif wildcard_search[0..5]=='233' && wildcard_search.length==12
     puts wildcard_search=CTRYCODE+"#{wildcard_search[3..wildcard_search.length]}"
   elsif wildcard_search[0]=='0' && wildcard_search.length==10
     puts "RUN THIS -------"
     puts wildcard_search = CTRYCODE+"#{wildcard_search[1..wildcard_search.length]}"
   elsif wildcard_search[0]=='0' && wildcard_search.length>10
     puts "RUN THIS IF ITS  STRING AND HAS more THAN 10  -------"
     puts wildcard_search = CTRYCODE+"#{wildcard_search[1..wildcard_search.length]}"
   elsif  wildcard_search.length==10
     puts "RUN THIS IF IS NOT A TRING-------"
     puts wildcard_search = CTRYCODE+"#{wildcard_search[1..wildcard_search.length]}"
   elsif wildcard_search[0] == '+' && wildcard_search[1..3] == '233'&& wildcard_search[4..wildcard_search.length].length == 9
     puts wildcard_search = CTRYCODE+"#{wildcard_search[4..wildcard_search.length]}"
   elsif wildcard_search[0] != "+" && wildcard_search[0..2]!='233' && wildcard_search.length == 9
     puts wildcard_search=CTRYCODE+"#{wildcard_search[0..wildcard_search.length]}"
    elsif wildcard_search[0] != "+" && wildcard_search[0..5]!='233' && wildcard_search.length == 9
     puts wildcard_search=CTRYCODE+"#{wildcard_search[0..wildcard_search.length]}"
   elsif wildcard_search[0..1]=='00'
     puts  wildcard_search=CTRYCODES+"#{wildcard_search[2..wildcard_search.length]}"
   end
   
   return wildcard_search
end



  def welcome
    if user_signed_in?
      @find_pds = PreAppointment.where(appointment_type_id: 'PD', requester_id: current_user.person_info.id).last
      
      logger.info "find personal doctors"
      logger.info @find_pds.inspect
      
      
    else
      
    end
     
  end 
  
  def index
    
  end
  
  def about
    
  end
  
  def services
    
  end
  
  def pricing
    
  end
  
  def blog
    
  end
  
  def contact
    
  end

 

  def elderlycare  
  
  end

  def chronic_disease

  end

  def annual_screening

  end


  def sendmsg(phone,msg)

    account_sid = 'AC2327f6201a02298610e5cc6df9b4b7e2'
    auth_token = 'ef45f23889f7730e8af70c5328db5d52'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    
    from = 'Ghinger' # Your Twilio number
    to = phone # Your mobile phone number
    @client.messages.create(
    from: from,
    to: to,
    body: msg
    )
    
    
    end
    
    
    CTRYCODE = '+233'.freeze
    CTRYCODES = '+'.freeze
    
    def validatePhoneNumber(mobile_number)
       wildcard_search = "#{mobile_number}"
       if wildcard_search[0..2]=='233' && wildcard_search.length==12
          wildcard_search=CTRYCODE+"#{wildcard_search[3..wildcard_search.length]}"
       elsif wildcard_search[0]=='0' && wildcard_search.length==10
          wildcard_search = CTRYCODE+"#{wildcard_search[1..wildcard_search.length]}"
       elsif wildcard_search[0] == '+' && wildcard_search[1..3] == '233'&& wildcard_search[4..wildcard_search.length].length == 9
          wildcard_search = CTRYCODE+"#{wildcard_search[4..wildcard_search.length]}"
       elsif wildcard_search[0] != "+" && wildcard_search[0..2]!='233' && wildcard_search.length == 9
          wildcard_search=CTRYCODE+"#{wildcard_search[0..wildcard_search.length]}"
          
       elsif wildcard_search[0..1]=='00'
           wildcard_search=CTRYCODES+"#{wildcard_search[2..wildcard_search.length]}"
       end
       
       return wildcard_search
    end






  def  update_subscription(trans_ref,field)
   subs =  SubsPayment.where(transaction_id: trans_ref)[0]
   subs_id = subs.subscription_id
   mon = SubscriptionNewMain.where(id: subs_id)[0]
   if mon !=nil
     if field == "success"
      mon.paid_status = 1
      mon.save
      elsif field == "failure"
        mon.paid_status = 0
        mon.save
     end
    else
      puts
      puts
      
     puts "NO TRANSACTION ID MATCH WAS FOUND"
     puts "NO TRANSACTION ID MATCH WAS FOUND"
     puts "NO TRANSACTION ID MATCH WAS FOUND"
     puts "NO TRANSACTION ID MATCH WAS FOUND"
     puts "NO TRANSACTION ID MATCH WAS FOUND"
     puts
     puts
     puts
   end

  end




  def update_status(trans_ref,field)

    mon = SubsPayment.where(transaction_id: trans_ref)[0]
     if mon != nil
       if field == "success"
         mon.trans_status = 1
         mon.trans_ref = trans_ref
         mon.save
   
      elsif field == "failure"
         mon.trans_status = 0
         mon.trans_ref = trans_ref
         mon.save
      end
     else
       puts
       puts
       
      puts "NO TRANSACTION ID MATCH WAS FOUND"
      puts "NO TRANSACTION ID MATCH WAS FOUND"
      puts "NO TRANSACTION ID MATCH WAS FOUND"
      puts "NO TRANSACTION ID MATCH WAS FOUND"
      puts "NO TRANSACTION ID MATCH WAS FOUND"
      puts
      puts
      puts
    end
   
   end
  
   def saveMMLog(resp_code, resp_desc, trans_ref, am_refid)
    PaymentState.create!(
    resp_code: resp_code,
    trans_msg: resp_desc,
    trans_id: trans_ref,
    trans_ref_id: am_refid,
    trans_status: 1
    
    )
  end
  
  
  
  def ghinger_momo_callback
  
    request.body.rewind
    req = JSON.parse request.body.read
  
    puts "THIS IS MY GHINGER CALLBACK  CALLBACK"
    puts
    puts req
  
    trans_id = req["trans_id"]
    trans_status = req["trans_status"]
    trans_ref = req["trans_ref"]
    message = req["message"]
  
    puts
    puts
    puts "---------PARAMETERS-------"
    puts "#{trans_id}"
    puts "#{trans_status}"
    puts "#{trans_ref}"
    puts "#{message}"
  
  
    trans_split = trans_status.split("/")
    trans_state = trans_split[0]
    network_state = trans_split[1]
  
    pay = SubsPayment.where(transaction_id: trans_ref).last
    customer_number = pay.customer_number
    amountb = pay.amount

    subs_id = pay.subscription_id
    mon = SubscriptionNewMain.where(id: subs_id)[0]
    user = mon.user_id

    othername = PersonInfo.where(id: user,active_status: true,del_status: false)[0]
    _othername = othername.other_names
    logger.info _othername.inspect
  

     phone_numbers = validatePhoneNumber(customer_number)
     messages = "Dear #{_othername}, payment has been made successfully.\n Amount: GHC #{amountb}"
     failed_message = "Dear #{_othername}, payment failed"
     logger.info messages.inspect
  
  
  
    if trans_state == "000"
  
        
      saveMMLog(trans_state, message, trans_ref, trans_id)
      update_status(trans_ref,"success")
      update_subscription(trans_ref,"success")
      logger.info sendmsg(phone_numbers,messages)
      puts "payment was successful"
       
    else 
  
      saveMMLog(trans_state, message, trans_ref, trans_id)
      update_status(trans_ref,"failure")
      update_subscription(trans_ref,"failure")
      logger.info sendmsg(phone_numbers,failed_message)
  
      puts "payment failed"
      
    end
  
  
  end 


  def ghinger_visa_callback

    request.body.rewind
    req = JSON.parse request.body.read
  
    puts "THIS IS MY GHINGER VISA CALLBACK  CALLBACK"
    puts
    puts req
  
    trans_id = req["trans_id"]
    trans_status = req["trans_status"]
    trans_ref = req["trans_ref"]
    message = req["message"]
  
    puts
    puts
    puts "---------PARAMETERS-------"
    puts "#{trans_id}"
    puts "#{trans_status}"
    puts "#{trans_ref}"
    puts "#{message}"
  
  
    trans_split = trans_status.split("/")
    trans_state = trans_split[0]
    network_state = trans_split[1]
  
    pay = SubsPayment.where(transaction_id: trans_ref).last
    amountb = pay.amount

    subs_id = pay.subscription_id
    mon = SubscriptionNewMain.where(id: subs_id)[0]
    user = mon.user_id

   
  
    
    phone = PersonContactInfo.where(person_id: user,active_status: true,del_status: false)[0]
    _phone = phone.contact_number
    logger.info _phone.inspect
     phone_numbers = validatePhoneNumber(_phone)

    othername = PersonInfo.where(id: user,active_status: true,del_status: false)[0]
    _othername = othername.other_names
    logger.info _othername.inspect
  

    
     messages = "Dear #{_othername}, payment has been made successfully.\n Amount: GHC #{amountb}"
     failed_message = "Dear #{_othername}, payment failed"
     logger.info messages.inspect
  
  
    if trans_state == "000"
  
        
      saveMMLog(trans_state, message, trans_ref, trans_id)
     
      update_status(trans_ref,"success")
      update_subscription(trans_ref,"success")
      logger.info sendmsg(phone_numbers,messages)
  
      puts "payment was successful"
       
    else 
  
      saveMMLog(trans_state, message, trans_ref, trans_id)
      update_status(trans_ref,"failure")
      update_subscription(trans_ref,"failure")
      logger.info sendmsg(phone_numbers,failed_message)
  
      puts "payment failed"
      
    end
    
  
  end




   
end
