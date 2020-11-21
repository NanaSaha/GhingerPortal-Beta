require 'test_helper'

class RequestUrgenciesControllerTest < ActionController::TestCase
  setup do
    @request_urgency = request_urgencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_urgencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_urgency" do
    assert_difference('RequestUrgency.count') do
      post :create, request_urgency: { ref_id: @request_urgency.ref_id, urgency: @request_urgency.urgency }
    end

    assert_redirected_to request_urgency_path(assigns(:request_urgency))
  end

  test "should show request_urgency" do
    get :show, id: @request_urgency
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_urgency
    assert_response :success
  end

  test "should update request_urgency" do
    patch :update, id: @request_urgency, request_urgency: { ref_id: @request_urgency.ref_id, urgency: @request_urgency.urgency }
    assert_redirected_to request_urgency_path(assigns(:request_urgency))
  end

  test "should destroy request_urgency" do
    assert_difference('RequestUrgency.count', -1) do
      delete :destroy, id: @request_urgency
    end

    assert_redirected_to request_urgencies_path
  end
end
