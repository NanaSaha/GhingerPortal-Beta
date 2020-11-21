require 'test_helper'

class PaymentReqsControllerTest < ActionController::TestCase
  setup do
    @payment_req = payment_reqs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_reqs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_req" do
    assert_difference('PaymentReq.count') do
      post :create, payment_req: { amount: @payment_req.amount, billing_info_id: @payment_req.billing_info_id, callback_url: @payment_req.callback_url, exttrid: @payment_req.exttrid, mobile_number: @payment_req.mobile_number, nw: @payment_req.nw, reference: @payment_req.reference }
    end

    assert_redirected_to payment_req_path(assigns(:payment_req))
  end

  test "should show payment_req" do
    get :show, id: @payment_req
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_req
    assert_response :success
  end

  test "should update payment_req" do
    patch :update, id: @payment_req, payment_req: { amount: @payment_req.amount, billing_info_id: @payment_req.billing_info_id, callback_url: @payment_req.callback_url, exttrid: @payment_req.exttrid, mobile_number: @payment_req.mobile_number, nw: @payment_req.nw, reference: @payment_req.reference }
    assert_redirected_to payment_req_path(assigns(:payment_req))
  end

  test "should destroy payment_req" do
    assert_difference('PaymentReq.count', -1) do
      delete :destroy, id: @payment_req
    end

    assert_redirected_to payment_reqs_path
  end
end
