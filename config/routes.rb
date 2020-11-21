Rails.application.routes.draw do

  
  
  resources :payment_states
  resources :feedbacks
  resources :subscription_remarks
  resources :subs_payments
  # resources :payment_states
  # resources :subs_payments
  # resources :subscription_remarks
  resources :subscription_new_mains
  # resources :feedbacks
  # root pages 
 
  resources :callback_statuses
  resources :payment_reqs
  resources :pre_payment_reqs
  resources :medication_details
  resources :service_fee_masters
  resources :billing_info_bill_items
  resources :patient_billing_infos
  resources :measure_units
  resources :drug_prices
  resources :drug_masters
  resources :decline_comments
  resources :pre_confirmed_appointments
  resources :referals
  resources :patient_med_records
  resources :pds_patient_prev_med_histories
  resources :confirmed_personal_doctor_services
  resources :engaged_user_services
  resources :user_services
  resources :roles
  resources :permission_roles
  resources :permissions
  resources :events
  resources :profesional_groups 
  resources :specialty_masters
  resources :confirmed_conditions
  resources :condition_masters
  resources :lab_detail_images
  resources :registrations
  resources :lab_details
  resources :lab_services
  resources :confirmed_appointments
  resources :requester_allergies
  resources :request_urgencies
  resources :request_categories
  devise_for :users
  resources :pre_appointments
  resources :appointment_types
  resources :allergies_masters
  resources :affected_system_masters
  resources :person_info_extras
  resources :person_contact_infos
  resources :provider_engaged_users
  resources :person_infos
  resources :person_type_masters
  resources :provider_masters
  resources :provider_services
  resources :service_prov_extra_infos
  resources :service_masters
  resources :service_prov_types
  resources :suburb_masters
  resources :city_town_masters
  resources :region_masters 
  resources :country_masters

   devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  # root pages 
  
  root 'home#welcome'

  get 'home/about' => 'home#welcome'
  
   get 'home/index', as: 'index' 
  #  get 'home/about', as: 'about'
  #  get 'home/services', as: 'services'
  #  get 'home/pricing', as: 'pricing'
  #  get 'home/blog', as: 'blog'
  #  get 'home/contact', as:  'contact'
   get 'home/elderlycare', as: 'elderlycare'
   get 'home/chronic_disease', as: 'chronic_disease'
   get 'home/annual_screening', as: 'annual_screening'
   get 'client_home/elderly', as: 'elderly'
   get 'client_home/elderlycare1', as: 'elderlycare1'
   get 'client_home/elderly_two', as: 'elderly_two'
   get 'client_home/elderly_three', as: 'elderly_three'
   get 'client_home/chronic_one', as: 'chronic_one'
   get 'client_home/chronic_two', as: 'chronic_two'
   get 'client_home/annual_screen_one', as: 'annual_screen_one'
   get 'client_home/annual_screen_two', as: 'annual_screen_two'
   get 'client_home/doctor_subscription', as: 'doctor_subscription'
   get 'client_home/doc_sub_detail', as: 'doc_sub_detail'
   get 'client_home/doc_remark_info', as: 'doc_remark_info'
   get 'client_home/subscriber_info', as: 'subscriber_info'
   get 'client_home/user_subs_detail', as: 'user_subs_detail'
   get 'client_home/user_pay', as: 'user_pay'
   get 'client_home/edit_info' => 'edit_info'



   post 'elderly_user_info' =>        'client_home#elderly_user_info'
   post 'elderly_user_info_two' =>        'client_home#elderly_user_info_two'
   post 'elderly_user_info_three' =>        'client_home#elderly_user_info_three'

   post 'chronic_user_info_one' =>        'client_home#chronic_user_info_one'
   post 'chronic_user_info_two' =>        'client_home#chronic_user_info_two'

   post 'annual_user_info_one' =>        'client_home#annual_user_info_one'
   post 'annual_user_info_two' =>        'client_home#annual_user_info_two' 
   

   post 'update_subscription' => 'subscription_new_mains#update_subscription'
   post 'remark_sub' => 'subscription_new_mains#remark_sub'
   post 'payme_user' => 'subscription_new_mains#payme_user'
   post 'ghinger_momo_callback' => 'home#ghinger_momo_callback'
   post 'ghinger_visa_callback' => 'home#ghinger_visa_callback'
  

  
  # Admin root path
   get '/admin/index' => 'admin#index', :as => 'admin_root'
   
  # doctor root path
  get '/doctor_home/index' => 'doctor_home#index', :as => 'doctor_root'
  
  # nurse root path
  get '/nurse_home/index' => 'nurse_home#index', :as => 'nurse_root'
  
  
  
   
  
  # resources :provider_masters do 
    # resources :service_prov_extra_infos
  # end 
  
  
  namespace :api do
    namespace :v1 do
       resources :person_infos
    end
     
  end
  
 
  devise_scope :user do
    get '/users/sign_up' => 'users#sign_in'
  end

  get '/users' => 'users#index'

  get '/users/new' => 'users#new', :as => 'new_user'
  post 'create_user' => 'users#create', as: :create_user
  get '/users/:id/edit' => 'users#edit', :as => 'edit_user'

  get '/users/:id' => 'users#show', :as => 'user'
  delete 'users/:id' => 'users#destroy'
  patch '/users/:id' => 'users#update', :as => 'update_user'
  
  get 'profile' => 'users#profile'
  get 'edit_profile' => 'person_infos#edit_profile'
  patch 'update_profile' => 'person_infos#update_profile'
  
  # credentials
  get 'user_credential' => 'users#user_credential'
  patch 'update_credential' => 'users#update_credential'
  
  
  
  
  # Enable and Disable country
  get       'enable_country'    =>  'country_masters#enable_country'
  get       'disable_country'   =>  'country_masters#disable_country'
  
  # Enable and disable region
  get       'enable_region'    =>  'region_masters#enable_region'
  get       'disable_region'   =>  'region_masters#disable_region'
  
  # Enable and disable city
  get       'enable_city'    =>  'city_town_masters#enable_city'
  get       'disable_city'   =>  'city_town_masters#disable_city'
  
  # Enable and disable suburb
  get       'enable_suburb'    =>  'suburb_masters#enable_suburb'
  get       'disable_suburb'   =>  'suburb_masters#disable_suburb'
  
  # Enable and disable provider type
  get       'enable_prov_type'    =>  'service_prov_types#enable_prov_type'
  get       'disable_prov_type'   =>  'service_prov_types#disable_prov_type'
  
  # Enable and disable service
  get       'enable_service'    =>  'service_masters#enable_service'
  get       'disable_service'   =>  'service_masters#disable_service'
  
  # Enable and disable service provider
  get       'enable_service_provider'    =>  'provider_masters#enable_service_provider'
  get       'disable_service_provider'   =>  'provider_masters#disable_service_provider'
  
  # Enable and disable provider service
  get       'enable_provider_service'    =>  'provider_services#enable_provider_service'
  get       'disable_provider_service'   =>  'provider_services#disable_provider_service'
  
  
  # Enable and disable user type
  get       'enable_user_type'    =>  'person_type_masters#enable_user_type'
  get       'disable_user_type'   =>  'person_type_masters#disable_user_type'
  
  
  # Enable and disable player
  get       'enable_player'    =>  'person_infos#enable_player'
  get       'disable_player'   =>  'person_infos#disable_player' 
  
    
  # Enable and disable human part
  get       'enable_part'    =>  'affected_system_masters#enable_part'
  get       'disable_part'   =>  'affected_system_masters#disable_part'  
  
     
  # Enable and disable allergy
  get       'enable_allergy'    =>  'allergies_masters#enable_allergy'
  get       'disable_allergy'   =>  'allergies_masters#disable_allergy' 
  
  # Enable and disable appointment type
  get       'enable_appointment_type'    =>  'appointment_types#enable_appointment_type'
  get       'disable_appointment_type'   =>   'appointment_types#disable_appointment_type'
  
  
  # Enable and disable pre_appointment
  get       'enable_pre_appointment'    =>  'pre_appointments#enable_pre_appointment'
  get       'disable_pre_appointment'   =>   'pre_appointments#disable_pre_appointment'
  
  # Enable and disable confirmed appointment
  get       'enable_appointment'    =>  'confirmed_appointments#enable_appointment'
  get       'disable_appointment'   =>   'confirmed_appointments#disable_appointment'
  
  # Enable and disable pre confirmed appointment
  get       'enable_pre_confirmed_appointment'    =>  'pre_confirmed_appointments#enable_pre_confirmed_appointment'
  get       'disable_pre_confirmed_appointment'   =>   'pre_confirmed_appointments#disable_pre_confirmed_appointment'
 
 # Enable and disable lab_service
  get       'enable_lab_service'    =>  'lab_services#enable_lab_service'
  get       'disable_lab_service'   =>  'lab_services#disable_lab_service'
  
  # Enable and disable pending registration
  get       'enable_pending_reg'    =>  'registrations#enable_pending_reg'
  get       'disable_pending_reg'   =>  'registrations#disable_pending_reg'

  # Enable and disable pending drug master
  get       'enable_drug'    =>  'drug_masters#enable_drug'
  get       'disable_drug'   =>  'drug_masters#disable_drug'

  # Enable and disable pending drug measuring unit
  get       'enable_unit'    =>  'measure_units#enable_unit'
  get       'disable_unit'   =>  'measure_units#disable_unit'

  # Enable and disable pending drug measuring unit
  get       'enable_price'    =>  'service_fee_masters#enable_price'
  get       'disable_price'   =>  'service_fee_masters#disable_price'





  # Approve registration
  get       'approve_registration'   =>  'registrations#approve_registration'
  get       'new_confirm_person_info'   =>  'person_info_extras#new_confirm_person_info' 
  post       'create_reg_confirm'   =>  'person_infos#create_reg_confirm'  
  post      'confirm_person_registration'   =>  'person_info_extras#confirm_person_registration'
  # post      'confirm_person_registration_prof_info'   =>  'person_infos#confirm_person_registration_prof'  
  
  # Find Billing information of appointment
  get 'bill_info' => 'patient_billing_infos#bill_info'

   get 'doctor_bill_info' => 'patient_billing_infos#doctor_bill_info'

  get 'nurse_bill_info' => 'patient_billing_infos#nurse_bill_info'
  
  get 'pay_link' =>  'pre_appointments#pay_link'
  
   

  ##############################################################
  # fetch lab images

  get 'fetch_image'  =>  'pre_appointments#fetch_image'

  # ###########################################################
  
  
  
  
   
  # Enable and disable approved registration
  get       'enable_approved_reg'    =>  'registrations#enable_approved_reg'
  get       'disable_approved_reg'   =>  'registrations#disable_approved_reg'
  
   # Enable and disable condition
  get       'enable_condition'    =>  'condition_masters#enable_condition'
  get       'disable_condition'   =>  'condition_masters#disable_condition'
  
   # Enable and disable specialty
  get       'enable_specialty'    =>  'specialty_masters#enable_specialty'
  get       'disable_specialty'   =>  'specialty_masters#disable_specialty' 
  
  # Enable and disable professional group
  get       'enable_professional_group'    =>  'profesional_groups#enable_professional_group'
  get       'disable_professional_group'   =>  'profesional_groups#disable_professional_group'  
  
  # Enable and disable roles
  get       'enable_role'    =>  'roles#enable_role'
  get       'disable_role'   =>  'roles#disable_role'  
  
  # Enable and disable user services
  get       'enable_user_service'    =>  'user_services#enable_user_service'
  get       'disable_user_service'   =>  'user_services#disable_user_service'
  
  
  # Enable and disable user engaged services
  get       'enable_engaged_user_service'    =>  'engaged_user_services#enable_engaged_user_service'
  get       'disable_engaged_user_service'   =>  'engaged_user_services#disable_engaged_user_service' 
  
  # Enable and disable confirmed pds
  get       'enable_confirmed_pds'    =>  'confirmed_personal_doctor_services#enable_confirmed_pds'
  get       'disable_confirmed_pds'   =>  'confirmed_personal_doctor_services#disable_confirmed_pds'  
  # personal patient delete by doctor
  get       'disable_personal_patient'   =>  'confirmed_personal_doctor_services#disable_personal_patient' 
  
  # Enable and referal
  get       'enable_referal'    =>  'referals#enable_referal'
  get       'disable_referal'   =>  'referals#disable_referal'  
  
  
  # personal patient details by doctor
  get       'find_patient_details'   =>  'confirmed_appointments#find_patient_details' 
  
   # process referal
  get       'process_referal'   =>  'person_infos#process_referal'
  
   # process referal create
  post  'process_referal_create'   =>  'person_infos#process_referal_create' 
  
  # process registration
  post 'process_registration' => 'registrations#process_registration'
  
   
  
   
  
  
  
 #filter for persons by person type 
  get  'filter' => 'person_infos#filter'
  
  #get provider details 
  get  'provider_details' => 'provider_masters#provider_details' 
  
  #get service details 
  get  'service_details' => 'service_masters#service_details' 
  
  #get professional details 
  get  'find_prof_info' => 'person_info_extras#find_prof_info' 
  
 
  #add allergies to pre_appointment
  get 'add_requester_allergy' => 'requester_allergies#add_requester_allergy'
  
  #Edit allergy
  get 'edit_allergy' => 'requester_allergies#edit_allergy'
  
  #Edit professional details
  get 'edit_prof_details' => 'person_info_extras#edit_prof_details'
  
  
  # Edit pds from confirmed appointments 
  get 'edit_pds_from_confirmed_appointment' => 'confirmed_personal_doctor_services#edit_pds_from_confirmed_appointment'
   
   
   
   
   
   
   
   
   
 #Find cities 
  get  'find_cities' => 'city_town_masters#find_cities'
  
 #Find countries
  get  'find_countries' => 'country_masters#find_countries'
  
  #Find suburbs
  get  'find_suburbs' => 'suburb_masters#find_suburbs'
  
  #Find provider type
  get  'find_prov_type' => 'provider_masters#find_prov_type'
  
  #Find provider type
  get  'find_services' => 'provider_services#find_services'
  
  # filter by country name
  get  'filter_by_country_name' => 'region_masters#filter_by_country_name'
  
  
  #Find extra info
  get  'find_extra_info' => 'service_prov_extra_infos#find_extra_info'
  
  #find staff
  get 'find_saff' => 'provider_engaged_users#find_saff'
  
  #find person
  get 'find_persons' => 'person_contact_infos#find_persons'
  
  
  #find allergies
  get 'find_allergies' => 'pre_appointments#find_allergies'
  
   #find lab details
  get 'find_lab_details' => 'lab_details#find_lab_details'

  get 'find_med_details' => 'medication_details#find_med_details'

  
  #find lab detail image
  get 'find_lab_detail_image' => 'lab_detail_images#find_lab_detail_image'
  
  
  #find engaged user service
  get 'find_engaged_user_service' => 'engaged_user_services#find_engaged_user_service'
  
 
  #download all country excel
  get 'all_country_excel' => 'country_masters#all_country_excel'
  
  #download all region excel
  get 'all_region_excel' => 'region_masters#all_region_excel'
  
  
  #download all cities excel
  get 'all_city_excel' => 'city_town_masters#all_city_excel'
  
  #download all suburb excel
  get 'all_suburb_excel' => 'suburb_masters#all_suburb_excel'
  
  #download all service excel
  get 'all_service_excel' => 'service_masters#all_service_excel'
  
  #download all service excel
  get 'all_service_prov_type_excel' => 'service_prov_types#all_service_prov_type_excel'
  
  
  #download all person info excel
  get 'all_person_info_excel' => 'person_infos#all_person_info_excel'
  
  #download all service provider excel
  get 'all_provider_excel' => 'provider_masters#all_provider_excel'
  
  #download all pre appointment excel 
  get 'all_pre_appointment_excel' => 'pre_appointments#all_pre_appointment_excel'
  
  #download all confirmed appointment excel 
  get 'all_confirmed_appointment_excel' => 'confirmed_appointments#all_confirmed_appointment_excel'
  
  #download all confirmed appointment excel 
  get 'all_pre_confirmed_appointment_excel' => 'confirmed_appointments#all_pre_confirmed_appointment_excel'
  
  #download all confirmed pds excel 
  get 'all_confirmed_pds_excel' => 'confirmed_personal_doctor_services#all_confirmed_pds_excel'

  #download all drugs excel
  get 'all_drug_excel' => 'drug_masters#all_drug_excel'

  # download all measure units excel
  get 'all_unit_excel' => 'measure_units#all_unit_excel'

  # download all measure units excel
  get 'all_price_excel' => 'service_fee_masters#all_price_excel'

  
  
  
  
  #download all registration excel 
  get 'pending_registrations' => 'registrations#pending_registrations'
  get 'approved_registrations' => 'registrations#approved_registrations'
  get 'all_pending_registration_excel' => 'registrations#all_pending_registration_excel'
  get 'all_approved_registration_excel' => 'registrations#all_approved_registration_excel'
  
  #download all lab services excel 
  get 'all_lab_service_excel' => 'lab_services#all_lab_service_excel'
  
  #download all allergies excel 
  get 'all_allergies_excel' => 'allergies_masters#all_allergies_excel'
  
  #download all condition excel 
  get 'all_condition_excel' => 'condition_masters#all_condition_excel'
  
  #download all  specialty excel 
  get 'all_specialty_excel' => 'specialty_masters#all_specialty_excel'
    
  #download all  professional group excel 
  get 'all_group_excel' => 'profesional_groups#all_group_excel'
  
  #download all roles excel 
  get 'all_role_excel' => 'roles#all_role_excel'
  
  #download all  permission excel 
  get 'all_permission_excel' => 'permissions#all_permission_excel'
  
  #download all user service excel 
  get 'all_user_service_excel' => 'user_services#all_user_service_excel' 
  
  
   #download all referals excel 
  get 'all_referal_excel' => 'referals#all_referal_excel' 
  
  
  
  
  
# Doctor Page routes

   
  # get doctor appointments
  get 'doctor_general_appointments' => 'confirmed_appointments#doctor_general_appointments'
  get 'doctor_pds_appointments' => 'confirmed_appointments#doctor_pds_appointments' 
  get 'doctor_awaiting_appointments' => 'pre_confirmed_appointments#doctor_awaiting_appointments'  
  
  # Doctor accept appointments
  get 'doctor_accept_gen_appt' => 'pre_confirmed_appointments#doctor_accept_gen_appt'
  get 'doctor_accept_pds_appt' => 'pre_confirmed_appointments#doctor_accept_pds_appt' 
     
  # Doctor decline appointments
  get 'doctor_decline_gen_appt' => 'pre_confirmed_appointments#doctor_decline_gen_appt'
  get 'doctor_decline_pds_appt' => 'pre_confirmed_appointments#doctor_decline_pds_appt'
  
 # create decline comment
 post 'create_gen_decline_comment' => 'pre_confirmed_appointments#create_gen_decline_comment'
  post 'create_pds_decline_comment' => 'pre_confirmed_appointments#create_pds_decline_comment'
 
 
 
 
  # get nurse appointments
  get 'nurse_appointments' => 'confirmed_appointments#nurse_appointments'
  
  
  #update_attend_status  
  get 'update_attend_status' => 'confirmed_appointments#update_attend_status'
  
  #update_processed_status for referals  
  get 'update_processed_status' => 'referals#update_processed_status'
  get 'processed_index' => 'referals#processed_index'
  
  
  
  # get doctor appointments
  get 'doctor_pds' => 'confirmed_appointments#doctor_pds'
  
  # get confirmed appointment for a patient to create a new record
  get 'patient_confirmed_unattended_to_appt' => 'patient_med_records#patient_confirmed_unattended_to_appt'
   
 #Doctor attend to general appointments
 get 'attend_to_patient_med_record' => 'patient_med_records#attend_to_patient_med_record'
 
 # create the patatient record
   post 'create_patient_med_record' => 'patient_med_records#create_patient_med_record'
   
   
   
 # get patient record details
  get 'record_detail' => 'patient_med_records#record_detail'
  get 'view_patient_med_record' => 'patient_med_records#view_patient_med_record'
  
  
  # get patient record to order
  get 'patient_unordered_record' => 'patient_med_records#patient_unordered_record'
  
  # order patient treatment
  get 'order_treatment' => 'patient_med_records#order_treatment'

  # Refer a patient
  get 'refer_patient' => 'referals#refer_patient'
  
  # Doctor's referals 
  get 'my_referal' => 'referals#my_referal'
  
   # place order for patient
  get 'place_order' => 'pre_appointments#place_order'
  
   # process order for patient
  post 'process_order' => 'pre_appointments#process_order'
  
   # create order show
  get 'create_order_show' => 'pre_appointments#create_order_show' 
  
  
  # cascading for Registration
  get 'get_location' => 'registrations#get_location'
  get 'get_location_process' => 'registrations#get_location_process'
  
  get 'user_prof_info' => 'registrations#user_prof_info'
  
  post 'process_user_prof_info' => 'registrations#process_user_prof_info'
  
  
  get  'find_regions' => 'registrations#find_regions'
  get  'find_cities_for_region' => 'registrations#find_cities_for_region'
  get  'find_suburbs_for_city' => 'registrations#find_suburbs_for_city'

  # For patients
     get  'my_appointment' => 'pre_appointments#my_appointment'
     get  'my_appointment_pds' => 'pre_appointments#my_appointment_pds'
     get  'select_appt_option' => 'pre_appointments#select_appt_option' 
     
     # new appointments
     get  'patient_new_appointment' => 'pre_appointments#patient_new_appointment'
     post  'process_patient_new_appointment' => 'pre_appointments#process_patient_new_appointment'
     get  'patient_new_appointment_pds' => 'pre_appointments#patient_new_appointment_pds'
     post  'process_patient_new_appointment_pds' => 'pre_appointments#process_patient_new_appointment_pds'
     
     
     # patient appointment details
     get  'patient_lab_details' => 'pre_appointments#patient_lab_details'
     get  'patient_video_details' => 'pre_appointments#patient_video_details'
     get  'patient_med_details' => 'pre_appointments#patient_med_details'
     get  'patient_medication_details' => 'pre_appointments#patient_medication_details'
     get  'patient_home_details' => 'pre_appointments#patient_home_details'
     get  'patient_phone_details' => 'pre_appointments#patient_phone_details'
     get  'patient_video_details_pds' => 'pre_appointments#patient_video_details_pds'
     get  'patient_home_details_pds' => 'pre_appointments#patient_home_details_pds'
     get  'patient_prescription_details' => 'pre_appointments#patient_prescription_details'
          
     # patient lab appointment image details
     get  'patient_lab_detail_image' => 'pre_appointments#patient_lab_detail_image'
     
     
     # patient medical record for an appointment
     get  'med_record' => 'pre_appointments#med_record'
     
     #find doctors and nurses that have appointment
     get  'find_doc_nurse' => 'pre_confirmed_appointments#find_doc_nurse'
     
     #find doctors and nurses decline notes
     get  'decline_note' => 'pre_confirmed_appointments#decline_note'
     
     
     # Preconfirm appointment details
     get  'pre_confirmed_appointment_details' => 'pre_confirmed_appointments#pre_confirmed_appointment_details'
     
     
end
