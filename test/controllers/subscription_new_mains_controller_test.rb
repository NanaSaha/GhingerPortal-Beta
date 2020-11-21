require 'test_helper'

class SubscriptionNewMainsControllerTest < ActionController::TestCase
  setup do
    @subscription_new_main = subscription_new_mains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subscription_new_mains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subscription_new_main" do
    assert_difference('SubscriptionNewMain.count') do
      post :create, subscription_new_main: { middle_name: @subscription_new_main.middle_name }
    end

    assert_redirected_to subscription_new_main_path(assigns(:subscription_new_main))
  end

  test "should show subscription_new_main" do
    get :show, id: @subscription_new_main
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subscription_new_main
    assert_response :success
  end

  test "should update subscription_new_main" do
    patch :update, id: @subscription_new_main, subscription_new_main: { middle_name: @subscription_new_main.middle_name }
    assert_redirected_to subscription_new_main_path(assigns(:subscription_new_main))
  end

  test "should destroy subscription_new_main" do
    assert_difference('SubscriptionNewMain.count', -1) do
      delete :destroy, id: @subscription_new_main
    end

    assert_redirected_to subscription_new_mains_path
  end
end
