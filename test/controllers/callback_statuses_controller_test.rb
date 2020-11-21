require 'test_helper'

class CallbackStatusesControllerTest < ActionController::TestCase
  setup do
    @callback_status = callback_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:callback_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create callback_status" do
    assert_difference('CallbackStatus.count') do
      post :create, callback_status: { exttrid: @callback_status.exttrid, trans_id: @callback_status.trans_id, trans_msg: @callback_status.trans_msg, trans_status: @callback_status.trans_status }
    end

    assert_redirected_to callback_status_path(assigns(:callback_status))
  end

  test "should show callback_status" do
    get :show, id: @callback_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @callback_status
    assert_response :success
  end

  test "should update callback_status" do
    patch :update, id: @callback_status, callback_status: { exttrid: @callback_status.exttrid, trans_id: @callback_status.trans_id, trans_msg: @callback_status.trans_msg, trans_status: @callback_status.trans_status }
    assert_redirected_to callback_status_path(assigns(:callback_status))
  end

  test "should destroy callback_status" do
    assert_difference('CallbackStatus.count', -1) do
      delete :destroy, id: @callback_status
    end

    assert_redirected_to callback_statuses_path
  end
end
