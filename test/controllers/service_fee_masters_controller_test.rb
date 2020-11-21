require 'test_helper'

class ServiceFeeMastersControllerTest < ActionController::TestCase
  setup do
    @service_fee_master = service_fee_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_fee_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_fee_master" do
    assert_difference('ServiceFeeMaster.count') do
      post :create, service_fee_master: { active_status: @service_fee_master.active_status, appt_type_id: @service_fee_master.appt_type_id, comment: @service_fee_master.comment, del_status: @service_fee_master.del_status, fee: @service_fee_master.fee, fee: @service_fee_master.fee, req_urgency: @service_fee_master.req_urgency, service_id: @service_fee_master.service_id, user_id: @service_fee_master.user_id }
    end

    assert_redirected_to service_fee_master_path(assigns(:service_fee_master))
  end

  test "should show service_fee_master" do
    get :show, id: @service_fee_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_fee_master
    assert_response :success
  end

  test "should update service_fee_master" do
    patch :update, id: @service_fee_master, service_fee_master: { active_status: @service_fee_master.active_status, appt_type_id: @service_fee_master.appt_type_id, comment: @service_fee_master.comment, del_status: @service_fee_master.del_status, fee: @service_fee_master.fee, fee: @service_fee_master.fee, req_urgency: @service_fee_master.req_urgency, service_id: @service_fee_master.service_id, user_id: @service_fee_master.user_id }
    assert_redirected_to service_fee_master_path(assigns(:service_fee_master))
  end

  test "should destroy service_fee_master" do
    assert_difference('ServiceFeeMaster.count', -1) do
      delete :destroy, id: @service_fee_master
    end

    assert_redirected_to service_fee_masters_path
  end
end
