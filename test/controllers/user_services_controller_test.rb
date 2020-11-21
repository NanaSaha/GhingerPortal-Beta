require 'test_helper'

class UserServicesControllerTest < ActionController::TestCase
  setup do
    @user_service = user_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_service" do
    assert_difference('UserService.count') do
      post :create, user_service: { active_status: @user_service.active_status, comment: @user_service.comment, del_status: @user_service.del_status, entity_id: @user_service.entity_id, service_alias: @user_service.service_alias, service_desc: @user_service.service_desc, user_id: @user_service.user_id }
    end

    assert_redirected_to user_service_path(assigns(:user_service))
  end

  test "should show user_service" do
    get :show, id: @user_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_service
    assert_response :success
  end

  test "should update user_service" do
    patch :update, id: @user_service, user_service: { active_status: @user_service.active_status, comment: @user_service.comment, del_status: @user_service.del_status, entity_id: @user_service.entity_id, service_alias: @user_service.service_alias, service_desc: @user_service.service_desc, user_id: @user_service.user_id }
    assert_redirected_to user_service_path(assigns(:user_service))
  end

  test "should destroy user_service" do
    assert_difference('UserService.count', -1) do
      delete :destroy, id: @user_service
    end

    assert_redirected_to user_services_path
  end
end
