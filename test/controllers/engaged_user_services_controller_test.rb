require 'test_helper'

class EngagedUserServicesControllerTest < ActionController::TestCase
  setup do
    @engaged_user_service = engaged_user_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:engaged_user_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create engaged_user_service" do
    assert_difference('EngagedUserService.count') do
      post :create, engaged_user_service: { active_status: @engaged_user_service.active_status, comment: @engaged_user_service.comment, del_status: @engaged_user_service.del_status, entity_id: @engaged_user_service.entity_id, person_id: @engaged_user_service.person_id, user_id: @engaged_user_service.user_id, user_service_id: @engaged_user_service.user_service_id }
    end

    assert_redirected_to engaged_user_service_path(assigns(:engaged_user_service))
  end

  test "should show engaged_user_service" do
    get :show, id: @engaged_user_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @engaged_user_service
    assert_response :success
  end

  test "should update engaged_user_service" do
    patch :update, id: @engaged_user_service, engaged_user_service: { active_status: @engaged_user_service.active_status, comment: @engaged_user_service.comment, del_status: @engaged_user_service.del_status, entity_id: @engaged_user_service.entity_id, person_id: @engaged_user_service.person_id, user_id: @engaged_user_service.user_id, user_service_id: @engaged_user_service.user_service_id }
    assert_redirected_to engaged_user_service_path(assigns(:engaged_user_service))
  end

  test "should destroy engaged_user_service" do
    assert_difference('EngagedUserService.count', -1) do
      delete :destroy, id: @engaged_user_service
    end

    assert_redirected_to engaged_user_services_path
  end
end
