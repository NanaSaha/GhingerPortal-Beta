require 'test_helper'

class SubscriptionRemarksControllerTest < ActionController::TestCase
  setup do
    @subscription_remark = subscription_remarks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subscription_remarks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subscription_remark" do
    assert_difference('SubscriptionRemark.count') do
      post :create, subscription_remark: { name: @subscription_remark.name }
    end

    assert_redirected_to subscription_remark_path(assigns(:subscription_remark))
  end

  test "should show subscription_remark" do
    get :show, id: @subscription_remark
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subscription_remark
    assert_response :success
  end

  test "should update subscription_remark" do
    patch :update, id: @subscription_remark, subscription_remark: { name: @subscription_remark.name }
    assert_redirected_to subscription_remark_path(assigns(:subscription_remark))
  end

  test "should destroy subscription_remark" do
    assert_difference('SubscriptionRemark.count', -1) do
      delete :destroy, id: @subscription_remark
    end

    assert_redirected_to subscription_remarks_path
  end
end
