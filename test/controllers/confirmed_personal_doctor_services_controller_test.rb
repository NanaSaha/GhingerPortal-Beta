require 'test_helper'

class ConfirmedPersonalDoctorServicesControllerTest < ActionController::TestCase
  setup do
    @confirmed_personal_doctor_service = confirmed_personal_doctor_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:confirmed_personal_doctor_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create confirmed_personal_doctor_service" do
    assert_difference('ConfirmedPersonalDoctorService.count') do
      post :create, confirmed_personal_doctor_service: { active_status: @confirmed_personal_doctor_service.active_status, comment: @confirmed_personal_doctor_service.comment, del_status: @confirmed_personal_doctor_service.del_status, doctor_id: @confirmed_personal_doctor_service.doctor_id, entity_id: @confirmed_personal_doctor_service.entity_id, patient_id: @confirmed_personal_doctor_service.patient_id, user_id: @confirmed_personal_doctor_service.user_id }
    end

    assert_redirected_to confirmed_personal_doctor_service_path(assigns(:confirmed_personal_doctor_service))
  end

  test "should show confirmed_personal_doctor_service" do
    get :show, id: @confirmed_personal_doctor_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @confirmed_personal_doctor_service
    assert_response :success
  end

  test "should update confirmed_personal_doctor_service" do
    patch :update, id: @confirmed_personal_doctor_service, confirmed_personal_doctor_service: { active_status: @confirmed_personal_doctor_service.active_status, comment: @confirmed_personal_doctor_service.comment, del_status: @confirmed_personal_doctor_service.del_status, doctor_id: @confirmed_personal_doctor_service.doctor_id, entity_id: @confirmed_personal_doctor_service.entity_id, patient_id: @confirmed_personal_doctor_service.patient_id, user_id: @confirmed_personal_doctor_service.user_id }
    assert_redirected_to confirmed_personal_doctor_service_path(assigns(:confirmed_personal_doctor_service))
  end

  test "should destroy confirmed_personal_doctor_service" do
    assert_difference('ConfirmedPersonalDoctorService.count', -1) do
      delete :destroy, id: @confirmed_personal_doctor_service
    end

    assert_redirected_to confirmed_personal_doctor_services_path
  end
end
