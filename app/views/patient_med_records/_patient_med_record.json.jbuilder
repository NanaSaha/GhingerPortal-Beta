json.extract! patient_med_record, :id, :confirmed_appt_id, :patient_id, :doctor_id, :clinical_complaints, :clinical_examinations, :working_diagnosis, :investigation_rquired, :treatments, :follow_up_plan, :created_at, :updated_at
json.url patient_med_record_url(patient_med_record, format: :json)
