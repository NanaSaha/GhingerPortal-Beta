require 'test_helper'

class ServiceProvTypesControllerTest < ActionController::TestCase
  setup do
    @service_prov_type = service_prov_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_prov_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_prov_type" do
    assert_difference('ServiceProvType.count') do
      post :create, service_prov_type: { active_status: @service_prov_type.active_status, change_status: @service_prov_type.change_status, comment: @service_prov_type.comment, entity_id: @service_prov_type.entity_id, service_prov_type_title: @service_prov_type.service_prov_type_title, user_id: @service_prov_type.user_id }
    end

    assert_redirected_to service_prov_type_path(assigns(:service_prov_type))
  end

  test "should show service_prov_type" do
    get :show, id: @service_prov_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_prov_type
    assert_response :success
  end

  test "should update service_prov_type" do
    patch :update, id: @service_prov_type, service_prov_type: { active_status: @service_prov_type.active_status, change_status: @service_prov_type.change_status, comment: @service_prov_type.comment, entity_id: @service_prov_type.entity_id, service_prov_type_title: @service_prov_type.service_prov_type_title, user_id: @service_prov_type.user_id }
    assert_redirected_to service_prov_type_path(assigns(:service_prov_type))
  end

  test "should destroy service_prov_type" do
    assert_difference('ServiceProvType.count', -1) do
      delete :destroy, id: @service_prov_type
    end

    assert_redirected_to service_prov_types_path
  end
end
