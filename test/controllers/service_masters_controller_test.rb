require 'test_helper'

class ServiceMastersControllerTest < ActionController::TestCase
  setup do
    @service_master = service_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_master" do
    assert_difference('ServiceMaster.count') do
      post :create, service_master: { active_status: @service_master.active_status, change_status: @service_master.change_status, comment: @service_master.comment, entity_id: @service_master.entity_id, title: @service_master.title, user_id: @service_master.user_id }
    end

    assert_redirected_to service_master_path(assigns(:service_master))
  end

  test "should show service_master" do
    get :show, id: @service_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_master
    assert_response :success
  end

  test "should update service_master" do
    patch :update, id: @service_master, service_master: { active_status: @service_master.active_status, change_status: @service_master.change_status, comment: @service_master.comment, entity_id: @service_master.entity_id, title: @service_master.title, user_id: @service_master.user_id }
    assert_redirected_to service_master_path(assigns(:service_master))
  end

  test "should destroy service_master" do
    assert_difference('ServiceMaster.count', -1) do
      delete :destroy, id: @service_master
    end

    assert_redirected_to service_masters_path
  end
end
