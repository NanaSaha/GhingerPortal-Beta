# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181115181240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affected_system_masters", force: :cascade do |t|
    t.string   "title"
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "entity_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "allergies_masters", force: :cascade do |t|
    t.string   "title"
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "entity"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "app_versions", force: :cascade do |t|
    t.text     "app_id",                                    null: false
    t.text     "app_version",                               null: false
    t.boolean  "act_status",                default: true
    t.boolean  "del_status",                default: false
    t.datetime "created_at",  precision: 0
    t.datetime "updated_at",  precision: 0
    t.text     "app_code"
    t.text     "platform"
  end

  create_table "appointment_types", force: :cascade do |t|
    t.string   "title"
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "entity_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "ref_id"
  end

  create_table "billing_info_bill_items", force: :cascade do |t|
    t.integer  "billing_info_id"
    t.integer  "item_id"
    t.decimal  "item_price",      precision: 10, scale: 2
    t.integer  "quantity",                                 default: 1
    t.string   "comment"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  create_table "callback_statuses", force: :cascade do |t|
    t.string   "trans_status"
    t.string   "trans_id"
    t.string   "exttrid"
    t.string   "trans_msg"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "city_town_masters", force: :cascade do |t|
    t.string   "city_town_name"
    t.string   "comment"
    t.integer  "region_id"
    t.integer  "entity_id"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "change_status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "condition_masters", force: :cascade do |t|
    t.string   "condition_name"
    t.string   "comment"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "confirmed_appointments", force: :cascade do |t|
    t.integer  "pre_appointment_id"
    t.integer  "provider_id"
    t.string   "complaint_desc"
    t.datetime "confirmed_date"
    t.time     "confirmed_time"
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "entity_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "suburb_id"
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.boolean  "attended_to"
    t.integer  "nurse_id"
    t.boolean  "paid"
  end

  create_table "confirmed_conditions", force: :cascade do |t|
    t.integer  "confirmed_appointment_id"
    t.integer  "condition_id"
    t.boolean  "allergy_id"
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "entity"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "confirmed_personal_doctor_services", force: :cascade do |t|
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.string   "comment"
    t.integer  "entity_id"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "pre_appointment_id"
    t.integer  "suburb_id"
    t.string   "appointment_type_id"
    t.integer  "confirmed_appointment_id"
  end

  create_table "country_masters", force: :cascade do |t|
    t.string   "country_name"
    t.string   "comment"
    t.integer  "entity_id"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "change_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "decline_comments", force: :cascade do |t|
    t.integer  "pre_confirmed_appointment_id"
    t.datetime "available_date"
    t.string   "comment"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "doctor_id"
    t.integer  "nurse_id"
  end

  create_table "drug_masters", force: :cascade do |t|
    t.string   "drug_name"
    t.string   "drug_alias"
    t.string   "comment"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "drug_prices", force: :cascade do |t|
    t.integer  "drug_id"
    t.decimal  "price",         precision: 10, scale: 2
    t.integer  "unit_id"
    t.string   "comment"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "engaged_user_services", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "user_service_id"
    t.string   "comment"
    t.string   "entity_id"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lab_detail_images", force: :cascade do |t|
    t.integer  "pre_appointment_id"
    t.integer  "lab_detail_id"
    t.string   "comment"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "lab_details", force: :cascade do |t|
    t.integer  "pre_appointment_id"
    t.integer  "lab_service_id"
    t.string   "comment"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "confirmed_appt_id"
  end

  create_table "lab_images", force: :cascade do |t|
    t.integer  "pre_appointment_id",                                            null: false
    t.string   "appointment_type_id", limit: 20
    t.integer  "requester_id"
    t.boolean  "act_status",                                    default: true
    t.boolean  "del_status",                                    default: false
    t.datetime "created_at",                      precision: 0
    t.datetime "updated_at",                      precision: 0
    t.string   "file_name",           limit: 255,                               null: false
  end

  create_table "lab_services", force: :cascade do |t|
    t.string   "title"
    t.decimal  "price"
    t.string   "comment"
    t.string   "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "measure_units", force: :cascade do |t|
    t.string   "unit_desc"
    t.string   "unit_alias"
    t.string   "comment"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "medication_details", force: :cascade do |t|
    t.integer  "confirmed_appt_id"
    t.integer  "drug_id"
    t.string   "comment"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "password_table", force: :cascade do |t|
    t.text    "password",      null: false
    t.text    "mobile_number", null: false
    t.time    "created_at"
    t.boolean "status"
    t.text    "username"
    t.text    "reset_token"
  end

  create_table "patient_billing_infos", force: :cascade do |t|
    t.integer  "appointment_id"
    t.boolean  "approval_status"
    t.datetime "approval_date"
    t.boolean  "payment_status"
    t.datetime "payment_date"
    t.string   "comment"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "patient_med_records", force: :cascade do |t|
    t.integer  "confirmed_appt_id"
    t.integer  "patient_id"
    t.integer  "doctor_id"
    t.text     "clinical_complaints"
    t.text     "clinical_examinations"
    t.text     "working_diagnosis"
    t.text     "investigation_rquired"
    t.text     "treatments"
    t.string   "follow_up_plan"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.boolean  "order_status"
    t.string   "medicine"
    t.integer  "quantity"
    t.string   "dosage"
    t.string   "frequency"
    t.integer  "no_of_days"
  end

  create_table "payment_reqs", force: :cascade do |t|
    t.integer  "billing_info_id"
    t.decimal  "amount",          precision: 10, scale: 2
    t.string   "reference"
    t.string   "exttrid"
    t.string   "mobile_number"
    t.string   "nw"
    t.text     "callback_url"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "pds_patient_prev_med_histories", force: :cascade do |t|
    t.integer  "confirmed_pds_id"
    t.string   "prev_med_histry"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string   "subject_class"
    t.string   "action"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "permissions_roles", force: :cascade do |t|
    t.integer  "person_type_master_id"
    t.integer  "permission_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "role_id"
  end

  create_table "person_contact_infos", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "contact_number"
    t.string   "email"
    t.string   "postal_address"
    t.string   "location_address"
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "entity_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "suburb_id"
  end

  create_table "person_info_extras", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "specialty_id"
    t.string   "specialty_duration"
    t.boolean  "has_specialty"
    t.boolean  "forign_training"
    t.string   "foreign_institution_desc"
    t.integer  "profession_group_id"
    t.string   "licence_number"
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "entity_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "foreign_licence_number"
    t.string   "hospital_name"
  end

  create_table "person_infos", force: :cascade do |t|
    t.string   "surname"
    t.string   "other_names"
    t.string   "person_type_id"
    t.integer  "entity_id"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "full_name"
    t.date     "dob"
    t.integer  "reg_id"
    t.boolean  "pd_sub"
  end

  create_table "person_type_masters", force: :cascade do |t|
    t.string   "user_type_title"
    t.string   "comment"
    t.integer  "entity"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "ref_id"
  end

  create_table "pre_appointments", force: :cascade do |t|
    t.integer  "provider_id"
    t.integer  "requester_id"
    t.string   "requester_cat"
    t.string   "beneficiary_name"
    t.string   "appointment_type_id"
    t.datetime "proposed_date"
    t.time     "proposed_time"
    t.string   "complaint_desc"
    t.string   "prev_medical_history"
    t.string   "req_urgency"
    t.string   "comment"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.boolean  "confirm_status"
    t.string   "src"
    t.text     "allergies"
    t.integer  "suburb_id"
    t.boolean  "has_pd"
    t.string   "pd_name"
    t.string   "medication"
    t.integer  "duration"
    t.text     "test_list"
    t.string   "beneficiary_phone_number"
    t.boolean  "pre_confirm_status"
    t.integer  "beneficiary_age"
    t.string   "beneficiary_gender"
    t.boolean  "counter_view"
  end

  create_table "pre_confirmed_appointments", force: :cascade do |t|
    t.integer  "pre_appointment_id"
    t.integer  "doctor_id"
    t.integer  "nurse_id"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "accepted_status"
    t.datetime "date_time"
    t.boolean  "decline_status"
    t.boolean  "closed"
    t.integer  "patient_id"
  end

  create_table "pre_payment_reqs", force: :cascade do |t|
    t.integer  "billing_info_id"
    t.decimal  "amount",          precision: 10, scale: 2
    t.string   "reference"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "profesional_groups", force: :cascade do |t|
    t.string   "group_name"
    t.string   "comment"
    t.string   "user_id"
    t.string   "entity_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "provider_engaged_users", force: :cascade do |t|
    t.integer  "provider_id"
    t.integer  "person_id"
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "entity_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "provider_masters", force: :cascade do |t|
    t.string   "provider_name"
    t.string   "alias"
    t.integer  "provider_type_id"
    t.string   "comment"
    t.integer  "entity_id"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "change_status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "provider_services", force: :cascade do |t|
    t.integer  "service_provider_id"
    t.integer  "service_id"
    t.string   "comment"
    t.integer  "entity_id"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "change_status"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "referals", force: :cascade do |t|
    t.string   "surname"
    t.string   "other_names"
    t.date     "dob"
    t.string   "contact"
    t.integer  "refered_by"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "processed_status"
  end

  create_table "region_masters", force: :cascade do |t|
    t.string   "region_state_name"
    t.string   "comment"
    t.integer  "country_id"
    t.integer  "entity_id"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "change_status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "registration", force: :cascade do |t|
    t.text     "surname",                           null: false
    t.text     "other_names",                       null: false
    t.string   "mobile_number",          limit: 50
    t.text     "password"
    t.boolean  "status"
    t.text     "telco"
    t.text     "src"
    t.boolean  "verified"
    t.text     "email"
    t.text     "user_type"
    t.integer  "surburb_id"
    t.integer  "user_id"
    t.text     "user_uniq_code"
    t.date     "dob"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "specialty_id"
    t.string   "specialty_duration"
    t.boolean  "has_specialty"
    t.boolean  "foreign_training"
    t.string   "foreign_institution"
    t.integer  "professional_group_id"
    t.string   "licence_number"
    t.string   "foreign_licence_number"
    t.boolean  "pd_sub"
    t.string   "hospital_name"
  end

  create_table "request_categories", force: :cascade do |t|
    t.string   "category"
    t.string   "ref_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "request_urgencies", force: :cascade do |t|
    t.string   "urgency"
    t.string   "ref_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requester_allergies", force: :cascade do |t|
    t.integer  "pre_appointment_id"
    t.integer  "allergy_id"
    t.string   "comment"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "requester_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "user_id"
    t.string   "comment"
    t.boolean  "active_status"
    t.boolean  "del_status"
  end

  create_table "service_fee_masters", force: :cascade do |t|
    t.string   "appt_type_id"
    t.integer  "service_id"
    t.string   "req_urgency"
    t.decimal  "fee",           precision: 10, scale: 2
    t.string   "comment"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "service_masters", force: :cascade do |t|
    t.string   "title"
    t.string   "comment"
    t.integer  "entity_id"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "change_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "service_prov_extra_infos", force: :cascade do |t|
    t.integer  "service_prov_id"
    t.integer  "suburb_id"
    t.string   "contact_number1"
    t.string   "contact_number2"
    t.string   "postal_address"
    t.string   "location_address"
    t.string   "contact_person_name"
    t.string   "web_url"
    t.string   "longitude"
    t.string   "latitude"
    t.string   "comment"
    t.integer  "entity_id"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "service_prov_types", force: :cascade do |t|
    t.string   "service_prov_type_title"
    t.string   "comment"
    t.integer  "entity_id"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "change_status"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "specialty_masters", force: :cascade do |t|
    t.string   "title"
    t.string   "alias"
    t.string   "comment"
    t.string   "user_id"
    t.string   "entity_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "suburb_masters", force: :cascade do |t|
    t.string   "suburb_name"
    t.string   "comment"
    t.integer  "city_town_id"
    t.integer  "entity_id"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "change_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "user_services", force: :cascade do |t|
    t.string   "service_desc"
    t.string   "service_alias"
    t.string   "comment"
    t.integer  "entity_id"
    t.integer  "user_id"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "person_id"
    t.string   "username"
    t.boolean  "active_status"
    t.boolean  "del_status"
    t.string   "profile_file_name"
    t.string   "profile_content_type"
    t.integer  "profile_file_size"
    t.datetime "profile_updated_at"
    t.integer  "role_id"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
