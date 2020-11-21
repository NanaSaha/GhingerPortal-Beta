class ClientHomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

     require 'twilio-ruby'

  require 'json'
  require 'faraday'
  require 'openssl'
  require 'uri'
  require 'net/http'
  
    def elderly
      @subscription_new_main = SubscriptionNewMain.new
  
    end
   
    def elderly_two
      @subscription_new_main = SubscriptionNewMain.new
  
    end

    def elderly_three
      @subscription_new_main = SubscriptionNewMain.new
  
    end

    def chronic_one
      @subscription_new_main = SubscriptionNewMain.new
  
    end

    def chronic_two
      @subscription_new_main = SubscriptionNewMain.new
  
    end

    def annual_screen_one
      @subscription_new_main = SubscriptionNewMain.new
    end

    def annual_screen_two
      @subscription_new_main = SubscriptionNewMain.new
    end


    def edit_info 
      @person_type_masters = PersonTypeMaster.all
      @user_id = current_user.id
      @user = User.find(@user_id)
      @person_id = @user.person_id
      @person_info = PersonInfo.find(@person_id)
    end



    def sendmsg(phone,msg)

      account_sid = 'AC2327f6201a02298610e5cc6df9b4b7e2'
      auth_token = 'ef45f23889f7730e8af70c5328db5d52'
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








    def doctor_subscription
      if params[:count]
        params[:count]
      else
        params[:count] = 10
      end
  
       if params[:page].present?
        page = params[:page].to_i
       else
       page = 1
      end
  
      if params[:per_page].present?
        perpage = params[:per_page]
      else
       perpage = 100
      end
     
    @doctors = PersonInfo.joins(:user).order('person_infos.person_type_id').where("person_infos.person_type_id = ? and users.active_status =?", "D", true)
    

    @doc_list = @doctors.map { |a|[a.id][0]}
    logger.info "doctor id with"
    logger.info @doc_list.inspect
    logger.info "-------------"


      @subscription_new_mains = SubscriptionNewMain.where(doc_id: @doc_list).paginate(:page => page, :per_page => params[:count]).order('created_at desc')

      logger.info "subscription_new_mains id with"
      logger.info @subscription_new_mains.inspect
      logger.info "-------------"


    end

    def doc_sub_detail

    end

    def doc_remark_info
      @subscription_new_main = SubscriptionNewMain.new

    end




    def subscriber_info
      if params[:count]
      params[:count]
    else
      params[:count] = 10
    end

     if params[:page].present?
      page = params[:page].to_i
     else
     page = 1
    end

    if params[:per_page].present?
      perpage = params[:per_page]
    else
     perpage = 100
    end
    @subscription_new_mains = SubscriptionNewMain.where(user_id: current_user.id).paginate(:page => page, :per_page => params[:count]).order('created_at desc')
    
    end

  
  def user_subs_detail

  end

  def user_pay
    @subscription_new_main = SubscriptionNewMain.new
    @paymentTypes = [['Mobile Money',"1"],['Debit/Credit Card',"2"]]
    
    @networks = [['Airtel','AIR'],['Mtn','MTN'],['Vodafone','VOD'],['Tigo','TIG']]
  end


    
    def elderlycare1
  
    end
     
      def elderly_user_info

        flash[:notice] = "Subscription was successfully submitted.Ghinger call center will contact you."
        logger.info SubscriptionNewMain.create!(
          f_name: params["first_name"],middle_name: params["middle_name"],
          last_name: params["last_name"],phone_number: params["phone"],email: params["email"],
          gender: params["gender"],marital_status: params["marital_status"],religion: params["religion"],
          sub_name: "ElderlyPersonsHomeVisit",sub_initial: "EDC",address: params["address"],emergency_name: params["emergency_name"],
          emergency_phone: params["emergency_phone"],emergency_email: params["emergency_email"],
          dob: params["dob"],age: params["age"],sub_self: params["sub_self"],
          emergency_address: params["emergency_address"],user_id: current_user.id,status: false,amount: params["amount"],paid_status: false,status3: true)

          othername = PersonInfo.where(id: current_user.id,active_status: true,del_status: false)[0]
          _othername = othername.other_names
          logger.info _othername.inspect
          phone = PersonContactInfo.where(person_id: current_user.id,active_status: true,del_status: false)[0]
          _phone = phone.contact_number
          logger.info _phone.inspect
           phone_numbers = validatePhoneNumber(_phone)
           message = "Dear #{_othername}, your Subscription is received and pending payments before a Doctor is assigned.Kindly complete payment from your subscription list on your profile(Home Page).\nSubscription Name: Elderly Persons Home Visit Fee: GHC#{params["amount"]}"
           logger.info message.inspect
           logger.info sendmsg(phone_numbers,message)
        
        
          redirect_to subscriber_info_path, notice: "Subscription was has been received. However, make payments here before a Doctor can be assigned. Thank you."


      end 


      def elderly_user_info_two
        flash[:notice] = "Subscription was successfully submitted.Ghinger call center will contact you."
        logger.info SubscriptionNewMain.create!(
          f_name: params["first_name"],middle_name: params["middle_name"],
          last_name: params["last_name"],phone_number: params["phone"],email: params["email"],email2: params["email2"],
          f_name_second: params["f_name_second"],m_name_second: params["m_name_second"],l_name_second: params["l_name_second"],
          gender: params["gender"],gender2: params["gender2"],phone2: params["phone2"],marital_status: params["marital_status"],religion: params["religion"],
          marital_status2: params["marital_status2"],religion2: params["religion2"],
          sub_name: "ElderlyCoupleHomeVisit",sub_initial: "EDC",address: params["address"],emergency_name: params["emergency_name"],
          emergency_phone: params["emergency_phone"],emergency_email: params["emergency_email"],
          dob: params["dob"],age: params["age"], dob2: params["dob2"],age2: params["age2"],sub_self: params["sub_self"],
          emergency_address: params["emergency_address"],user_id: current_user.id,status: false,amount: params["amount"],paid_status: false,status3: true)
        
          othername = PersonInfo.where(id: current_user.id,active_status: true,del_status: false)[0]
          _othername = othername.other_names
          logger.info _othername.inspect
          phone = PersonContactInfo.where(person_id: current_user.id,active_status: true,del_status: false)[0]
          _phone = phone.contact_number
          logger.info _phone.inspect
           phone_numbers = validatePhoneNumber(_phone)
           message = "Dear #{_othername}, your Subscription is received and pending payments before a Doctor is assigned.Kindly complete payment from your subscription list on your profile(Home Page).\nSubscription Name: Elderly Couple Home Visit in one Address Fee: GHC#{params["amount"]}"
           logger.info message.inspect
           logger.info sendmsg(phone_numbers,message)

          redirect_to subscriber_info_path, notice: "Subscription was has been received. However, make payments here before a Doctor can be assigned. Thank you."
      end
      

      def elderly_user_info_three
        logger.info "-------running elderly three------"
        flash[:notice] = "Subscription was successfully submitted.Ghinger call center will contact you."
        logger.info SubscriptionNewMain.create!(
          f_name: params["first_name"],middle_name: params["middle_name"],
          last_name: params["last_name"],phone_number: params["phone"],email: params["email"],email2: params["email2"],
          gender2: params["gender2"],phone2: params["phone2"],
          gender: params["gender"],marital_status: params["marital_status"],religion: params["religion"],
          marital_status2: params["marital_status2"],religion2: params["religion2"],
          f_name_second: params["f_name_second"],m_name_second: params["m_name_second"],l_name_second: params["l_name_second"],
          phone_number_second: params["phone_number_second"],address_second: params["address_second"],
          sub_name: "ElderlyCoupleDifferentVisit",sub_initial: "EDC",address: params["address"],emergency_name: params["emergency_name"],
          emergency_phone: params["emergency_phone"],emergency_email: params["emergency_email"],
          dob: params["dob"],age: params["age"],sub_self: params["sub_self"],dob2: params["dob2"],age2: params["age2"],
          emergency_address: params["emergency_address"],user_id: current_user.id,status: false,amount: params["amount"],paid_status: false,status3: true)
          

          othername = PersonInfo.where(id: current_user.id,active_status: true,del_status: false)[0]
          _othername = othername.other_names
          logger.info _othername.inspect
          phone = PersonContactInfo.where(person_id: current_user.id,active_status: true,del_status: false)[0]
          _phone = phone.contact_number
          logger.info _phone.inspect
           phone_numbers = validatePhoneNumber(_phone)
           message = "Dear #{_othername},your Subscription is received and pending payments before a Doctor is assigned.Kindly complete payment from your subscription list on your profile(Home Page).\nSubscription Name: Elderly Couple Visit in different Addresses Fee: GHC#{params["amount"]}"
           logger.info message.inspect
           logger.info sendmsg(phone_numbers,message)
        
           redirect_to subscriber_info_path, notice: "Subscription was has been received. However, make payments here before a Doctor can be assigned. Thank you."
      end


      def chronic_user_info_one
        logger.info "-------running chronic one------"
        flash[:notice] = "Subscription was successfully submitted.Ghinger call center will contact you."
        logger.info SubscriptionNewMain.create!(
          f_name: params["first_name"],middle_name: params["middle_name"],
          last_name: params["last_name"],phone_number: params["phone"],email: params["email"],
          gender: params["gender"],marital_status: params["marital_status"],religion: params["religion"],
          sub_name: "QuarterlyHealthSurveillanceSingles",sub_initial: "CHR",address: params["address"],emergency_name: params["emergency_name"],
          emergency_phone: params["emergency_phone"],emergency_email: params["emergency_email"],
          dob: params["dob"],age: params["age"],sub_self: params["sub_self"],
          emergency_address: params["emergency_address"],user_id: current_user.id,status: false,amount: params["amount"],paid_status: false,status3: true)
          
          othername = PersonInfo.where(id: current_user.id,active_status: true,del_status: false)[0]
          _othername = othername.other_names
          logger.info _othername.inspect
          phone = PersonContactInfo.where(person_id: current_user.id,active_status: true,del_status: false)[0]
          _phone = phone.contact_number
          logger.info _phone.inspect
           phone_numbers = validatePhoneNumber(_phone)
           message = "Dear #{_othername}, your Subscription is received and pending payments before a Doctor is assigned.Kindly complete payment from your subscription list on your profile(Home Page).\nSubscription Name: Chronic Disease Care Fee: GHC#{params["amount"]}"
           logger.info message.inspect
           logger.info sendmsg(phone_numbers,message)

        
           redirect_to subscriber_info_path, notice: "Subscription was has been received. However, make payments here before a Doctor can be assigned. Thank you."
      end


      def chronic_user_info_two

        logger.info "-------running chronic two------"
        flash[:notice] = "Subscription was successfully submitted.Ghinger call center will contact you."
        logger.info SubscriptionNewMain.create!(
          f_name: params["first_name"],middle_name: params["middle_name"],
          last_name: params["last_name"],phone_number: params["phone"],email: params["email"],email2: params["email2"],
          gender2: params["gender2"],phone2: params["phone2"],
          f_name_second: params["f_name_second"],m_name_second: params["m_name_second"],l_name_second: params["l_name_second"],
          gender: params["gender"],marital_status: params["marital_status"],religion: params["religion"],
          marital_status2: params["marital_status2"],religion2: params["religion2"],address_second: params["address_second"],
          sub_name: "QuarterlyHealthSurveillanceCouples",sub_initial: "CHR",address: params["address"],emergency_name: params["emergency_name"],
          emergency_phone: params["emergency_phone"],emergency_email: params["emergency_email"],
          dob: params["dob"],age: params["age"],dob2: params["dob2"],age2: params["age2"],sub_self: params["sub_self"],
          emergency_address: params["emergency_address"],user_id: current_user.id,status: false,amount: params["amount"],paid_status: false,status3: true)
        
          othername = PersonInfo.where(id: current_user.id,active_status: true,del_status: false)[0]
          _othername = othername.other_names
          logger.info _othername.inspect
          phone = PersonContactInfo.where(person_id: current_user.id,active_status: true,del_status: false)[0]
          _phone = phone.contact_number
          logger.info _phone.inspect
           phone_numbers = validatePhoneNumber(_phone)
           message = "Dear #{_othername}, your Subscription is received and pending payments before a Doctor is assigned.Kindly complete payment from your subscription list on your profile(Home Page).\nSubscription Name: Chronic Disease Care Fee: GHC#{params["amount"]}"
           logger.info message.inspect
           logger.info sendmsg(phone_numbers,message)

           redirect_to subscriber_info_path, notice: "Subscription was has been received. However, make payments here before a Doctor can be assigned. Thank you."

      end

      def annual_user_info_one

        logger.info "-------running annual screening one------"
        flash[:notice] = "Subscription was successfully submitted.Ghinger call center will contact you."
        logger.info SubscriptionNewMain.create!(
          f_name: params["first_name"],middle_name: params["middle_name"],
          last_name: params["last_name"],phone_number: params["phone"],email: params["email"],
          gender: params["gender"],marital_status: params["marital_status"],religion: params["religion"],
          sub_name: "AnnualScreeningSingleAdult",sub_initial: "ANS",address: params["address"],emergency_name: params["emergency_name"],
          emergency_phone: params["emergency_phone"],emergency_email: params["emergency_email"],
          dob: params["dob"],age: params["age"],sub_self: params["sub_self"],
          emergency_address: params["emergency_address"],user_id: current_user.id,status: false,amount: params["amount"],paid_status: false,status3: true)
          
          othername = PersonInfo.where(id: current_user.id,active_status: true,del_status: false)[0]
          _othername = othername.other_names
          logger.info _othername.inspect
          phone = PersonContactInfo.where(person_id: current_user.id,active_status: true,del_status: false)[0]
          _phone = phone.contact_number
          logger.info _phone.inspect
           phone_numbers = validatePhoneNumber(_phone)
           message = "Dear #{_othername}, your Subscription is received and pending payments before a Doctor is assigned.Kindly complete payment from your subscription list on your profile(Home Page).\nSubscription Name: Annual Screening Fee: GHC#{params["amount"]}"
           logger.info message.inspect
           logger.info sendmsg(phone_numbers,message)
        
         redirect_to subscriber_info_path, notice: "Subscription was has been received. However, make payments here before a Doctor can be assigned. Thank you."

      end
      
      def annual_user_info_two

        logger.info "-------running annual screening two------"
        flash[:notice] = "Subscription was successfully submitted.Ghinger call center will contact you."
        logger.info SubscriptionNewMain.create!(
          f_name: params["first_name"],middle_name: params["middle_name"],
          last_name: params["last_name"],phone_number: params["phone"],email: params["email"],email2: params["email2"],
          gender2: params["gender2"],phone2: params["phone2"],
          f_name_second: params["f_name_second"],m_name_second: params["m_name_second"],l_name_second: params["l_name_second"],
          gender: params["gender"],marital_status: params["marital_status"],religion: params["religion"],
          marital_status2: params["marital_status2"],religion2: params["religion2"],address_second: params["address_second"],
          sub_name: "AnnualScreeningTwoAdult",sub_initial: "ANS",address: params["address"],emergency_name: params["emergency_name"],
          emergency_phone: params["emergency_phone"],emergency_email: params["emergency_email"],
          dob: params["dob"],age: params["age"],dob2: params["dob2"],age2: params["age2"],sub_self: params["sub_self"],
          emergency_address: params["emergency_address"],user_id: current_user.id,status: false,amount: params["amount"],paid_status: false,status3: true)
          
          othername = PersonInfo.where(id: current_user.id,active_status: true,del_status: false)[0]
          _othername = othername.other_names
          logger.info _othername.inspect
          phone = PersonContactInfo.where(person_id: current_user.id,active_status: true,del_status: false)[0]
          _phone = phone.contact_number
          logger.info _phone.inspect
           phone_numbers = validatePhoneNumber(_phone)
           message = "Dear #{_othername}, your Subscription is received and pending payments before a Doctor is assigned.Kindly complete payment from your subscription list on your profile(Home Page).\nSubscription Name: Annual Screening Fee: GHC#{params["amount"]}"
           logger.info message.inspect
           logger.info sendmsg(phone_numbers,message)
        
           redirect_to subscriber_info_path, notice: "Subscription was has been received. However, make payments here before a Doctor can be assigned. Thank you."

      end









    
  end
  
