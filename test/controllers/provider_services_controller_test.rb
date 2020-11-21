require 'test_helper'

class ProviderServicesControllerTest < ActionController::TestCase
  setup do
    @provider_service = provider_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:provider_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create provider_service" do
    assert_difference('ProviderService.count') do
      post :create, provider_service: { active_status: @provider_service.active_status, change_status: @provider_service.change_status, comment: @provider_service.comment, entity_id: @provider_service.entity_id, service_id: @provider_service.service_id, service_provider_id: @provider_service.service_provider_id, user_id: @provider_service.user_id }
    end

    assert_redirected_to provider_service_path(assigns(:provider_service))
  end

  test "should show provider_service" do
    get :show, id: @provider_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @provider_service
    assert_response :success
  end

  test "should update provider_service" do
    patch :update, id: @provider_service, provider_service: { active_status: @provider_service.active_status, change_status: @provider_service.change_status, comment: @provider_service.comment, entity_id: @provider_service.entity_id, service_id: @provider_service.service_id, service_provider_id: @provider_service.service_provider_id, user_id: @provider_service.user_id }
    assert_redirected_to provider_service_path(assigns(:provider_service))
  end

  test "should destroy provider_service" do
    assert_difference('ProviderService.count', -1) do
      delete :destroy, id: @provider_service
    end

    assert_redirected_to provider_services_path
  end
end
