class PatientBillingInfosController < ApplicationController
  before_action :set_patient_billing_info, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  # load_and_authorize_resource
  # before_filter :load_permissions
  include GhingerApi
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



  # GET /patient_billing_infos
  # GET /patient_billing_infos.json
  def index
    @all_billings = PatientBillingInfo.joins(:billing_info_bill_items)
                        .where("patient_billing_infos.active_status is true and patient_billing_infos.del_status is false").distinct
                        .paginate(:page => params[:page], :per_page => 30).order('patient_billing_infos.created_at desc')
  end

  # GET /patient_billing_infos/1
  # GET /patient_billing_infos/1.json
  def show
  end

  # GET /patient_billing_infos/new
  def new
    @patient_billing_info = PatientBillingInfo.new
    @patient_billing_info.billing_info_bill_items.build
  end

  # GET /patient_billing_infos/1/edit
  def edit
  end

  def bill_info
    confirmed_appt_id = params[:appointment_id]
    @from = params[:from]
     @bill_infos = PatientBillingInfo.find_by_appointment_id(confirmed_appt_id)
    @bill_info = PatientBillingInfo.joins("left join billing_info_bill_items on patient_billing_infos.id = billing_info_bill_items.billing_info_id
                                   left join confirmed_appointments on patient_billing_infos.appointment_id = confirmed_appointments.id
                                   left join pre_appointments on confirmed_appointments.pre_appointment_id = pre_appointments.id
                                   left join appointment_types on pre_appointments.appointment_type_id = appointment_types.ref_id
                                   left  join service_fee_masters on appointment_types.ref_id = service_fee_masters.appt_type_id")
                                   .where("patient_billing_infos.appointment_id =?", confirmed_appt_id)
                                   .select("appointment_types.title, service_fee_masters.fee, billing_info_bill_items.quantity,
                                    billing_info_bill_items.item_price, pre_appointments.appointment_type_id")[0]

    if @bill_info.present?
      if @bill_info.appointment_type_id == "MD"
        # medication items billing
        @med_bills = PatientBillingInfo.joins("left join billing_info_bill_items on patient_billing_infos.id = billing_info_bill_items.billing_info_id
                                   left join drug_masters on billing_info_bill_items.item_id = drug_masters.id
                                   left join drug_prices on drug_masters.id = drug_prices.drug_id")
                         .where("patient_billing_infos.appointment_id =? ", confirmed_appt_id)
                         .select("drug_masters.drug_name, drug_prices.price, billing_info_bill_items.quantity, billing_info_bill_items.item_price")

      elsif @bill_info.appointment_type_id == "LA"
        @lab_bills = PatientBillingInfo.joins("left join billing_info_bill_items on patient_billing_infos.id = billing_info_bill_items.billing_info_id
                                   left join lab_services on billing_info_bill_items.item_id = lab_services.id
                                   left join service_fee_masters on lab_services.id = service_fee_masters.service_id")
                         .where("patient_billing_infos.appointment_id =? and service_fee_masters.appt_type_id =?", confirmed_appt_id, "LA")
                         .select("lab_services.title, service_fee_masters.fee, billing_info_bill_items.quantity, billing_info_bill_items.item_price")

      end
    end

  end

  # POST /patient_billing_infos
  # POST /patient_billing_infos.json
  def create
    ghinger_conn = Connect.new
    @patient_billing_info = PatientBillingInfo.new(patient_billing_info_params)

    respond_to do |format|
      if @patient_billing_info.save
        format.js #{ flash[:notice] = "Billing prepared successfully "}

        # bill details
        if @patient_billing_info.confirmed_appointment.pre_appointment.appointment_type_id == "MD"
          # medication items billing
          @med_bills = PatientBillingInfo.joins("left join billing_info_bill_items on patient_billing_infos.id = billing_info_bill_items.billing_info_id
                                 left join drug_masters on billing_info_bill_items.item_id = drug_masters.id
                                 left join drug_prices on drug_masters.id = drug_prices.drug_id")
                                .where("patient_billing_infos.appointment_id =? ", @patient_billing_info.appointment_id)
                                .select("drug_masters.drug_name, drug_prices.price, billing_info_bill_items.quantity, billing_info_bill_items.item_price")

        elsif @patient_billing_info.confirmed_appointment.pre_appointment.appointment_type_id == "LA"
          @lab_bills = PatientBillingInfo.joins("left join billing_info_bill_items on patient_billing_infos.id = billing_info_bill_items.billing_info_id
                                 left join lab_services on billing_info_bill_items.item_id = lab_services.id
                                 left join service_fee_masters on lab_services.id = service_fee_masters.service_id")
                           .where("patient_billing_infos.appointment_id =? and service_fee_masters.appt_type_id =?", @patient_billing_info.appointment_id, "LA")
                           .select("lab_services.title, service_fee_masters.fee, billing_info_bill_items.quantity, billing_info_bill_items.item_price")

        end

        pre_appointment_id =  @patient_billing_info.confirmed_appointment.pre_appointment_id
        pre_appointment = PreAppointment.find(pre_appointment_id)
        user_number =  pre_appointment.person_info.person_contact_infos[0].contact_number
        user_email =  pre_appointment.person_info.person_contact_infos[0].email

        if pre_appointment.appointment_type_id == "MA" or pre_appointment.appointment_type_id == "PD"
          message = "Dear, #{pre_appointment.person_info.other_names}, your appointment on Ghinger Health Care has been sent to doctors for acceptance. You will be notify once a doctor accepts. "

          #Validate phone number
        if user_number[0..2]=='233' 
          puts sendmsg(user_number,message)
        
         elsif (user_number[0..2]=='020' || user_number[0..2]=='050' || user_number[0..2]=='027') 
             puts sendmsg(user_number,message)
         elsif (user_number[0..2]=='026' || user_number[0..2]=='056' || user_number[0..2]=='057') 
              puts sendmsg(user_number,message)
          elsif (user_number[0..2]=='024' || user_number[0..2]=='054' || user_number[0..2]=='055')
              puts sendmsg(user_number,message)
           else
              puts "NUMBER NOT VALID"
         end


            
        else
          message = "Dear, #{pre_appointment.person_info.other_names}, the billing for an appointment on Ghinger Health Care is ready. Kindly log on to Ghinger and approve the bill for the appointment."

             #Validate phone number
        if user_number[0..2]=='233' 
          puts sendmsg(user_number,message)
        
         elsif (user_number[0..2]=='020' || user_number[0..2]=='050' || user_number[0..2]=='027') 
             puts sendmsg(user_number,message)
         elsif (user_number[0..2]=='026' || user_number[0..2]=='056' || user_number[0..2]=='057') 
              puts sendmsg(user_number,message)
          elsif (user_number[0..2]=='024' || user_number[0..2]=='054' || user_number[0..2]=='055')
              puts sendmsg(user_number,message)
           else
               puts "NUMBER NOT VALID"
         end
        end

   


        # format.html { redirect_to @patient_billing_info, notice: 'Patient billing info was successfully created.' }
        format.json { render :show, status: :created, location: @patient_billing_info }
      else
        format.html { render :new }
        format.json { render json: @patient_billing_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patient_billing_infos/1
  # PATCH/PUT /patient_billing_infos/1.json
  def update
    respond_to do |format|
      if @patient_billing_info.update(patient_billing_info_params)
        format.html { redirect_to @patient_billing_info, notice: 'Patient billing info was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient_billing_info }
      else
        format.html { render :edit }
        format.json { render json: @patient_billing_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_billing_infos/1
  # DELETE /patient_billing_infos/1.json
  def destroy
    @patient_billing_info.destroy
    respond_to do |format|
      format.html { redirect_to patient_billing_infos_url, notice: 'Patient billing info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_billing_info
      @patient_billing_info = PatientBillingInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_billing_info_params
      params.require(:patient_billing_info).permit(:appointment_id, :approval_status, :approval_date, :payment_status, :payment_date, :comment, :user_id, :active_status, :del_status, billing_info_bill_items_attributes: [:id, :billing_info_id, :item_id, :item_price, :item_price, :quantity, :comment, :user_id, :active_status, :del_status, :_destroy])
    end
end
