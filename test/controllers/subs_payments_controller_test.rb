require 'test_helper'

class SubsPaymentsControllerTest < ActionController::TestCase
  setup do
    @subs_payment = subs_payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subs_payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subs_payment" do
    assert_difference('SubsPayment.count') do
      post :create, subs_payment: { name: @subs_payment.name }
    end

    assert_redirected_to subs_payment_path(assigns(:subs_payment))
  end

  test "should show subs_payment" do
    get :show, id: @subs_payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subs_payment
    assert_response :success
  end

  test "should update subs_payment" do
    patch :update, id: @subs_payment, subs_payment: { name: @subs_payment.name }
    assert_redirected_to subs_payment_path(assigns(:subs_payment))
  end

  test "should destroy subs_payment" do
    assert_difference('SubsPayment.count', -1) do
      delete :destroy, id: @subs_payment
    end

    assert_redirected_to subs_payments_path
  end
end
