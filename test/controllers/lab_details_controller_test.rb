require 'test_helper'

class LabDetailsControllerTest < ActionController::TestCase
  setup do
    @lab_detail = lab_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lab_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lab_detail" do
    assert_difference('LabDetail.count') do
      post :create, lab_detail: { active_status: @lab_detail.active_status, comment: @lab_detail.comment, del_status: @lab_detail.del_status, lab_service_id: @lab_detail.lab_service_id, pre_appointment_id: @lab_detail.pre_appointment_id, user_id: @lab_detail.user_id }
    end

    assert_redirected_to lab_detail_path(assigns(:lab_detail))
  end

  test "should show lab_detail" do
    get :show, id: @lab_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lab_detail
    assert_response :success
  end

  test "should update lab_detail" do
    patch :update, id: @lab_detail, lab_detail: { active_status: @lab_detail.active_status, comment: @lab_detail.comment, del_status: @lab_detail.del_status, lab_service_id: @lab_detail.lab_service_id, pre_appointment_id: @lab_detail.pre_appointment_id, user_id: @lab_detail.user_id }
    assert_redirected_to lab_detail_path(assigns(:lab_detail))
  end

  test "should destroy lab_detail" do
    assert_difference('LabDetail.count', -1) do
      delete :destroy, id: @lab_detail
    end

    assert_redirected_to lab_details_path
  end
end
