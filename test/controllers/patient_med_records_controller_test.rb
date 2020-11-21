require 'test_helper'

class PatientMedRecordsControllerTest < ActionController::TestCase
  setup do
    @patient_med_record = patient_med_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_med_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient_med_record" do
    assert_difference('PatientMedRecord.count') do
      post :create, patient_med_record: { clinical_complaints: @patient_med_record.clinical_complaints, clinical_examinations: @patient_med_record.clinical_examinations, confirmed_appt_id: @patient_med_record.confirmed_appt_id, doctor_id: @patient_med_record.doctor_id, follow_up_plan: @patient_med_record.follow_up_plan, investigation_rquired: @patient_med_record.investigation_rquired, patient_id: @patient_med_record.patient_id, treatments: @patient_med_record.treatments, working_diagnosis: @patient_med_record.working_diagnosis }
    end

    assert_redirected_to patient_med_record_path(assigns(:patient_med_record))
  end

  test "should show patient_med_record" do
    get :show, id: @patient_med_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @patient_med_record
    assert_response :success
  end

  test "should update patient_med_record" do
    patch :update, id: @patient_med_record, patient_med_record: { clinical_complaints: @patient_med_record.clinical_complaints, clinical_examinations: @patient_med_record.clinical_examinations, confirmed_appt_id: @patient_med_record.confirmed_appt_id, doctor_id: @patient_med_record.doctor_id, follow_up_plan: @patient_med_record.follow_up_plan, investigation_rquired: @patient_med_record.investigation_rquired, patient_id: @patient_med_record.patient_id, treatments: @patient_med_record.treatments, working_diagnosis: @patient_med_record.working_diagnosis }
    assert_redirected_to patient_med_record_path(assigns(:patient_med_record))
  end

  test "should destroy patient_med_record" do
    assert_difference('PatientMedRecord.count', -1) do
      delete :destroy, id: @patient_med_record
    end

    assert_redirected_to patient_med_records_path
  end
end
