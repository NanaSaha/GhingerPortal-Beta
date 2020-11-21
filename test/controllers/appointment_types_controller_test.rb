require 'test_helper'

class AppointmentTypesControllerTest < ActionController::TestCase
  setup do
    @appointment_type = appointment_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appointment_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appointment_type" do
    assert_difference('AppointmentType.count') do
      post :create, appointment_type: { active_status: @appointment_type.active_status, comment: @appointment_type.comment, del_status: @appointment_type.del_status, entity_id: @appointment_type.entity_id, title: @appointment_type.title, user_id: @appointment_type.user_id }
    end

    assert_redirected_to appointment_type_path(assigns(:appointment_type))
  end

  test "should show appointment_type" do
    get :show, id: @appointment_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appointment_type
    assert_response :success
  end

  test "should update appointment_type" do
    patch :update, id: @appointment_type, appointment_type: { active_status: @appointment_type.active_status, comment: @appointment_type.comment, del_status: @appointment_type.del_status, entity_id: @appointment_type.entity_id, title: @appointment_type.title, user_id: @appointment_type.user_id }
    assert_redirected_to appointment_type_path(assigns(:appointment_type))
  end

  test "should destroy appointment_type" do
    assert_difference('AppointmentType.count', -1) do
      delete :destroy, id: @appointment_type
    end

    assert_redirected_to appointment_types_path
  end
end
