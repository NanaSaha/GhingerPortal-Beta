require 'test_helper'

class PaymentStatesControllerTest < ActionController::TestCase
  setup do
    @payment_state = payment_states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_state" do
    assert_difference('PaymentState.count') do
      post :create, payment_state: { name: @payment_state.name }
    end

    assert_redirected_to payment_state_path(assigns(:payment_state))
  end

  test "should show payment_state" do
    get :show, id: @payment_state
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_state
    assert_response :success
  end

  test "should update payment_state" do
    patch :update, id: @payment_state, payment_state: { name: @payment_state.name }
    assert_redirected_to payment_state_path(assigns(:payment_state))
  end

  test "should destroy payment_state" do
    assert_difference('PaymentState.count', -1) do
      delete :destroy, id: @payment_state
    end

    assert_redirected_to payment_states_path
  end
end
