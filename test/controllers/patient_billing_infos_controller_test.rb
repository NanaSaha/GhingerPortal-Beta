require 'test_helper'

class PatientBillingInfosControllerTest < ActionController::TestCase
  setup do
    @patient_billing_info = patient_billing_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_billing_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient_billing_info" do
    assert_difference('PatientBillingInfo.count') do
      post :create, patient_billing_info: { active_status: @patient_billing_info.active_status, appointment_id: @patient_billing_info.appointment_id, approval_date: @patient_billing_info.approval_date, approval_status: @patient_billing_info.approval_status, comment: @patient_billing_info.comment, del_status: @patient_billing_info.del_status, payment_date: @patient_billing_info.payment_date, payment_status: @patient_billing_info.payment_status, user_id: @patient_billing_info.user_id }
    end

    assert_redirected_to patient_billing_info_path(assigns(:patient_billing_info))
  end

  test "should show patient_billing_info" do
    get :show, id: @patient_billing_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @patient_billing_info
    assert_response :success
  end

  test "should update patient_billing_info" do
    patch :update, id: @patient_billing_info, patient_billing_info: { active_status: @patient_billing_info.active_status, appointment_id: @patient_billing_info.appointment_id, approval_date: @patient_billing_info.approval_date, approval_status: @patient_billing_info.approval_status, comment: @patient_billing_info.comment, del_status: @patient_billing_info.del_status, payment_date: @patient_billing_info.payment_date, payment_status: @patient_billing_info.payment_status, user_id: @patient_billing_info.user_id }
    assert_redirected_to patient_billing_info_path(assigns(:patient_billing_info))
  end

  test "should destroy patient_billing_info" do
    assert_difference('PatientBillingInfo.count', -1) do
      delete :destroy, id: @patient_billing_info
    end

    assert_redirected_to patient_billing_infos_path
  end
end
