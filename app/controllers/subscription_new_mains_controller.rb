class SubscriptionNewMainsController < ApplicationController
  before_action :set_subscription_new_main, only: [:show, :edit, :update, :destroy]
  #skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
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




  def index
     
    if params[:per_page].present?
      if params[:per_page] == "All"
       @per_page = 10000000000000000
      else
      @per_page = params[:per_page]
      end
     else
   @per_page = 40
  end

  logger.info "----------------------------"
     logger.info "params:: #{params.inspect}"
  logger.info "----------------------------"


  list_of_search_str = []
  list_of_search_str << SubscriptionNewMain.subscription_search(params[:subnames]) unless params[:subnames].blank?

    unless params[:fullname].blank?
      list_of_search_str << SubscriptionNewMain.fullname_search(params[:fullname])
     
    end

    unless params[:status].blank?
      list_of_search_str << SubscriptionNewMain.status_search(params[:status])
     
    end

    list_of_search_str << SubscriptionNewMain.search_date(params[:start_date], params[:end_date]) if SubscriptionNewMain.search_date(params[:start_date], params[:end_date]) != ""
    search_str = list_of_search_str.join(" AND ")


           logger.info "----------------------------"
           logger.info "list_of_search_str:: #{list_of_search_str.inspect}"
           logger.info "----------------------------"
  
    


    @subscription_new_mains = SubscriptionNewMain.where(search_str).paginate(:page => params[:page], :per_page => @per_page).order('created_at desc')
  end



  

  # GET /subscription_new_mains/1
  # GET /subscription_new_mains/1.json
  def show
  end



  # GET /subscription_new_mains/new
  def new
    @subscription_new_main = SubscriptionNewMain.new
    @doctors = PersonInfo.joins(:user).order('person_infos.person_type_id').where("person_infos.person_type_id = ? and users.active_status =?", "D", true)
    #@nurses = PersonInfo.joins(:user).order('person_infos.person_type_id').where("person_infos.person_type_id = ? and users.active_status =?", "N", true )

    @doc_list = @doctors.map { |a|[a.surname+" "+a.other_names+" ",a.id]  }
    #@nurse_list = @nurses.map { |a|[a.surname+" "+a.other_names+" ",a.id]  }

    logger.info "----doctor and nurse list-------------"

    logger.info @doc_list
    #logger.info @nurse_list

  end

  # GET /subscription_new_mains/1/edit
  def edit
  end

 




  def update_subscription
    @subs_id = params[:id].to_i
    @dates = subscription_new_main_params[:assign_date]
    @docs = subscription_new_main_params[:doc_id]
    logger.info "The sub Id is still still #{@subs_id.inspect}"
    logger.info "The dates is still still #{@dates.inspect}"
    logger.info "The docs is still still #{@docs.inspect}"

    @subscription_new_main = SubscriptionNewMain.find_by_id(@subs_id)
    logger.info "Subscription #{@subscription_new_main.inspect}"
    @user_id = @subscription_new_main.user_id

      logger.info "USER ID FROM SUBSCRIPTION #{@user_id}"

    @update_reg = @subscription_new_main.update(
      assign_date: subscription_new_main_params[:assign_date],
      doc_id: subscription_new_main_params[:doc_id],
      status: true
  
   )

   othername = PersonInfo.where(id: @user_id,active_status: true,del_status: false)[0]
   _othername = othername.other_names
   logger.info _othername.inspect
   phone = PersonContactInfo.where(person_id: @user_id,active_status: true,del_status: false)[0]
   _phone = phone.contact_number
   logger.info _phone.inspect
    phone_numbers = validatePhoneNumber(_phone)
    message = "Dear #{_othername}, your Subscription has been assigned to a Doctor.\n Thank you."
    logger.info message.inspect
    logger.info sendmsg(phone_numbers,message)

   respond_to do |format|     
    if @update_reg == true
      format.html { redirect_to subscription_new_mains_url, notice: 'Doctor was Assigned successfully.' }
      format.json { head :no_content }
     
     
      
    else
      format.html { redirect_to subscription_new_mains_url, notice: 'Doctor was not Assigned, please try again.' }
      format.json { head :no_content }
   
   
    end
  
end


 end

 ######## payment request to appsnMobile api ######################
 CTRYCODE = '233'.freeze

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
  end
  
  return wildcard_search
end

def genUniqueCodeCredit
  time = Time.new
  strtm = time.strftime('%d%L%H%M')
  uniq_id = "GIHC#{strtm}"
  uniq_id
end



 
REQHDR = {'Content-Type'=>'Application/json','timeout'=>'180'}
TRANS_TYPES = 'CTM'
CLIENT_ID = "30"
STR_CLIENT_KEY = "ig6onp6eJY1dmESscCpH4PlZLUN3C0k5GWz1RmnzBhvczcmK2csF9/A54Mg2F7No3anReNJwMY/kWZ9H4W1K9g=="
STR_SEC_KEY = "QNFpot9mMHojSR4QQAQThq8bPo1oruVPXhW4PzDS1NlfmCxTi2Uywvy1imqhmfXW0GRqPTPU4MGss4XFxR1wHA=="
GHINGER_URL = "http://ghinger.devdexsoftware.com/ghinger_momo_callback"
GhINGER_REF = "GHINGERHEALTHCARE"
GHINGER_VISA_URL = "http://ghinger.devdexsoftware.com/ghinger_visa_callback"
VISA_LANDING_PAGE = "http://ghinger.devdexsoftware.com/"
VISA_PAYMENT_MODE = "CRD"
VISA_CURRENCY_CODE = "GHS"








################ VISA REQUEST #######################################################


def visaReq(nickname, amount, callback_url, client_id, landing_page, payment_mode,currency_code,u_code,ref,client_key,secret_key)
  

  
  url = 'https://payments.anmgw.com'
  url_endpoint = '/cards_request'
  conn = Faraday.new(url: url, headers: REQHDR, ssl: { verify: false }) do |f|
          f.response :logger
          f.adapter Faraday.default_adapter
  end
  

ts=Time.now.strftime("%Y-%m-%d %H:%M:%S")
puts

puts
payload={
     :nickname => nickname,
     :amount => amount,
     :exttrid => u_code,
     :reference => ref,
     :callback_url => callback_url,
     :service_id => client_id,
     :ts => ts,
     :landing_page => landing_page,
     :payment_mode => payment_mode,
     :currency_code=> currency_code,
   
 }
puts
puts "Hello world Two..."
puts
json_payload=JSON.generate(payload)
msg_endpoint="#{json_payload}"

logger.info "#############################"
logger.info "#############################"
logger.info "#############################"
logger.info "#############################"
logger.info "JSON payload: #{json_payload}.inspect"
logger.info "#############################"
logger.info "#############################"
logger.info "#############################"
logger.info "#############################"


def computeSignature(secret, data)
  digest=OpenSSL::Digest.new('sha256')
  signature = OpenSSL::HMAC.hexdigest(digest, secret.to_s, data)
  return signature
end
signature=computeSignature(secret_key, json_payload)
begin
   resp = conn.post do |req|
          req.url url_endpoint
          req.options.timeout = 30           # open/read timeout in seconds
          req.options.open_timeout = 30      # connection open timeout in seconds
          req['Authorization'] = "#{client_key}:#{signature}"
          req.body = json_payload
   end
      
        bidy = resp.body
        
        logger.info "#############################"
        logger.info "#############################"
        logger.info "#############################"
        logger.info "#############################"
        red = JSON.parse(bidy)
        logger.info urls =  red["redirect_url"]
        logger.info success = red["resp_code"]
     

        logger.info "#############################"
        logger.info "#############################"
        logger.info "#############################"

        
        puts bidy.inspect
        puts resp  
        puts resp.body  
        puts "Result from AMFP: #{resp.body}"
      
        respond_to do |format|     
          if success == "000"
            format.html { redirect_to urls, notice: 'Kindly authorize payment.' }
            format.json { head :no_content }
           
            
            
          else
            format.html { redirect_to root_path, notice: 'Payment was not Successful, please try again.' }
            format.json { head :no_content }
         
         
          end
        
        end 


        #resp.body

rescue
  puts "errorrrrrrrrrrrrr"
end

end


# def redirect_urls(urls,p_type)
 
# end







########### END OF VISA REQUEST ######################################################




def mobileMoneyReq(customer_number, amount, callback_url, client_id, nw, trans_type,v_num,u_code,ref,client_key,secret_key)
  

  
   url = 'https://orchard-api.anmgw.com'
   url_endpoint = '/sendRequest'
   conn = Faraday.new(url: url, headers: REQHDR, ssl: { verify: false }) do |f|
           f.response :logger
           f.adapter Faraday.default_adapter
   end
   
 
 ts=Time.now.strftime("%Y-%m-%d %H:%M:%S")
 puts
 puts "Hello world... with the network #{nw}"
 puts
 payload={
      :customer_number => customer_number,
      :reference => ref,
      :amount => amount,
      :exttrid => u_code,
      :nw => nw,
      :trans_type => trans_type,
      :callback_url => callback_url,
      :ts => ts,
      :service_id => client_id,
      :voucher_code=> v_num
  }
 puts
 puts "Hello world Two..."
 puts
 json_payload=JSON.generate(payload)
 msg_endpoint="#{json_payload}"
 puts
 puts "JSON payload: #{json_payload}"
 puts
 def computeSignature(secret, data)
   digest=OpenSSL::Digest.new('sha256')
   signature = OpenSSL::HMAC.hexdigest(digest, secret.to_s, data)
   return signature
 end
 signature=computeSignature(secret_key, json_payload)
 begin
    resp = conn.post do |req|
           req.url url_endpoint
           req.options.timeout = 30           # open/read timeout in seconds
           req.options.open_timeout = 30      # connection open timeout in seconds
           req['Authorization'] = "#{client_key}:#{signature}"
           req.body = json_payload
    end
         
         bidy = resp.body
         
         puts bidy.inspect
         puts resp  
         puts resp.body  
         puts "Result from AMFP: #{resp.body}"
         puts
         phone_numbers = validatePhoneNumber(customer_number)
         logger.info sendmsg(phone_numbers,"Kindly Authorize payment from your momo wallet")
         
         resp.body
 rescue
   puts "errorrrrrrrrrrrrr"
 end
 
 end
 
 #################################### END OF ORCHARD FUNCTION ################################################
 
 
 # ################################### END OF ORCHARD FUNCTION ################################################
 
 def makeRequest2AMFPOKF(customer_number, amount, callback_url, client_id, nw, trans_type,v_num,u_code,ref,client_key,secret_key)
   puts
   puts "*******************************************"
   puts
   puts nw
   
   if nw == 'MTN'    # MTN
     
     puts "============================MTN============================="
     #Thread.new do
     @@amfp_resp  = mobileMoneyReq(customer_number, amount, callback_url, client_id, nw, trans_type,v_num,u_code,ref,client_key,secret_key)
     #end 
   elsif nw == 'VOD' # VODA
     #Thread.new do
    @@amfp_resp = mobileMoneyReq(customer_number, amount, callback_url, client_id, nw, trans_type,v_num,u_code,ref,client_key,secret_key)
    #end
   elsif nw == 'TIG' # TIG
     #Thread.new do
     @@amfp_resp =mobileMoneyReq(customer_number, amount, callback_url, client_id, nw, trans_type,v_num,u_code,ref,client_key,secret_key)
    #end
   elsif nw == 'AIR' # AIR
     #Thread.new do
     @@amfp_resp = mobileMoneyReq(customer_number, amount, callback_url, client_id, nw, trans_type,v_num,u_code,ref,client_key,secret_key)
     #end
   end
   

 end
 
 ####################### END OF ORCHARD ###########################################



def payme_user

  @subs_id = params[:id].to_i
  @mobile_number = subscription_new_main_params[:mobile_number]
  @net = subscription_new_main_params[:networks]
  @p_type = subscription_new_main_params[:payment_types]
  @v_oucher_code = subscription_new_main_params[:voucher]
  
  logger.info "The subscription Id is  #{@subs_id.inspect}"
  logger.info "The mobile number is #{@mobile_number.inspect}"
  logger.info "The network is #{@net.inspect}"
  logger.info "The payment type is #{@p_type.inspect}"


  if @p_type == "1"
    logger.info "--------mobile money payments here---------"
    u_code = genUniqueCodeCredit
    _amount = SubscriptionNewMain.where(id: @subs_id,paid_status: false)[0]
    amounts = _amount.amount
    @create_subs = SubsPayment.create!(
      subscription_id: @subs_id,
      customer_number:  @mobile_number,
      network:  @net,
      payment_type:  @p_type,
      transaction_id: u_code,
      amount: amounts,
      trans_type: TRANS_TYPES,
      reference: GhINGER_REF,
      callback_url: GHINGER_URL,
      status: true,
      trans_status: false

    )

   
    if @net == "VOD"
      voucher_code = @v_oucher_code
    else 
      voucher_code = ""
    end
    #Thread.new do
     logger.info makeRequest2AMFPOKF(@mobile_number,amounts,GHINGER_URL, CLIENT_ID,@net, TRANS_TYPES,voucher_code,u_code,GhINGER_REF,STR_CLIENT_KEY,STR_SEC_KEY)
     
    #end


    respond_to do |format|     
      if @create_subs == true
        format.html { redirect_to subscriber_info_path, notice: 'Kindly authorize payment from your wallet.' }
        format.json { head :no_content }
       
        
        
      else
        format.html { redirect_to subscriber_info_path, notice: 'Payment was not Successful, please try again.' }
        format.json { head :no_content }
     
     
      end
    
    end



  elsif @p_type == "2"

    logger.info "--------visa card payments here---------"
    @subs_id = params[:id].to_i
    @card_name = subscription_new_main_params[:card_name]
 

    logger.info "The subscription Id is  #{@subs_id.inspect}"
    logger.info "The card_name is #{@card_name.inspect}"

    u_code = genUniqueCodeCredit
    _amount = SubscriptionNewMain.where(id: @subs_id,paid_status: false)[0]
    amounts = _amount.amount

    @create_subs_visa = SubsPayment.create!(
      subscription_id: @subs_id,
      card_name:  @card_name,
      payment_type:  @p_type,
      transaction_id: u_code,
      amount: amounts,
      reference: GhINGER_REF,
      callback_url: GHINGER_VISA_URL,
      status: true,
      trans_status: false

    )

  logger.info visaReq(@card_name,amounts, GHINGER_VISA_URL, CLIENT_ID, VISA_LANDING_PAGE, VISA_PAYMENT_MODE,VISA_CURRENCY_CODE,u_code,GhINGER_REF,STR_CLIENT_KEY,STR_SEC_KEY)

    
  


  end



end







def remark_sub
  @subs_id = params[:id].to_i
  @remarks = subscription_new_main_params[:remark]
  logger.info "The sub Id is still still #{@subs_id.inspect}"
  logger.info "The remark still still #{@remarks.inspect}"
  
  #@subscription_new_main = SubscriptionNewMain.find_by_id(@subs_id)
  #logger.info "Subscription remark id #{@subscription_new_main.inspect}"

  @create_sub = SubscriptionRemark.create(
    sub_id: @subs_id,
    remark: subscription_new_main_params[:remark],
    status: true
 )


 respond_to do |format|     
  if @create_sub == true
    format.html { redirect_to doctor_subscription_url, notice: 'Doctor remark submitted successfully.' }
    format.json { head :no_content }
   
    
    
  else
    format.html { redirect_to doctor_subscription_url, notice: 'Doctor remark was not submitted, please try again.' }
    format.json { head :no_content }
 
 
  end

end



end







  # POST /subscription_new_mains
  # POST /subscription_new_mains.json
  def create
    @subscription_new_main = SubscriptionNewMain.new(subscription_new_main_params)

    respond_to do |format|
      if @subscription_new_main.save
        format.html { redirect_to @subscription_new_main, notice: 'Subscription new main was successfully created.' }
        format.json { render :show, status: :created, location: @subscription_new_main }
      else
        format.html { render :new }
        format.json { render json: @subscription_new_main.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscription_new_mains/1
  # PATCH/PUT /subscription_new_mains/1.json
  def update
    respond_to do |format|
      if @subscription_new_main.update(subscription_new_main_params)
        format.html { redirect_to @subscription_new_main, notice: 'Subscription new main was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscription_new_main }
      else
        format.html { render :edit }
        format.json { render json: @subscription_new_main.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscription_new_mains/1
  # DELETE /subscription_new_mains/1.json
  def destroy
  

    puts "............JUST STARTING Subscription disable and enable.................."
    if @subscription_new_main.status3
       @subscription_new_main.status3 = 0
       @subscription_new_main.save
       
       @subscription_new_main =  SubscriptionNewMain.order('created_at desc')
       
       
    respond_to do |format|
     format.html { redirect_to subscription_new_mains_url, notice: 'Subscription was successfully disabled.' }
     format.json { head :no_content }
   end
   
  
   else
  
       @subscription_new_main.status3 = 1
       @subscription_new_main.save
       
       @subscription_new_main =  SubscriptionNewMain.order('created_at desc')
       
       
    respond_to do |format|
     format.html { redirect_to subscription_new_mains_url, notice: 'Subscription was successfully enabled.' }
     format.json { head :no_content }
   end
    
   
      
 end





  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription_new_main
      @subscription_new_main = SubscriptionNewMain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_new_main_params
      params.require(:subscription_new_main).permit(:f_name, :middle_name, :last_name, :phone_number,:phone2, :email2, :gender2, :email, :gender, :marital_status2, :religion2,:marital_status, :religion, :sub_name, :sub_initial, :address,:dob2,:age2, :emergency_name, :emergency_phone, :emergency_email, :emergency_address, :status, :amount, :paid_status,:assign_date,:doc_id,:status3,:remark,:user_id,:payment_types, :networks,:mobile_number,:card_name,:voucher,:dob,:age,:sub_self,:f_name_second,:m_name_second,:l_name_second,:phone_number_second,:address_second)
    end
end
