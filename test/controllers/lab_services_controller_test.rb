require 'test_helper'

class LabServicesControllerTest < ActionController::TestCase
  setup do
    @lab_service = lab_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lab_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lab_service" do
    assert_difference('LabService.count') do
      post :create, lab_service: { active_status: @lab_service.active_status, comment: @lab_service.comment, del_status: @lab_service.del_status, price: @lab_service.price, title: @lab_service.title, user_id: @lab_service.user_id }
    end

    assert_redirected_to lab_service_path(assigns(:lab_service))
  end

  test "should show lab_service" do
    get :show, id: @lab_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lab_service
    assert_response :success
  end

  test "should update lab_service" do
    patch :update, id: @lab_service, lab_service: { active_status: @lab_service.active_status, comment: @lab_service.comment, del_status: @lab_service.del_status, price: @lab_service.price, title: @lab_service.title, user_id: @lab_service.user_id }
    assert_redirected_to lab_service_path(assigns(:lab_service))
  end

  test "should destroy lab_service" do
    assert_difference('LabService.count', -1) do
      delete :destroy, id: @lab_service
    end

    assert_redirected_to lab_services_path
  end
end
