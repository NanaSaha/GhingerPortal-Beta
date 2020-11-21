require 'test_helper'

class PrePaymentReqsControllerTest < ActionController::TestCase
  setup do
    @pre_payment_req = pre_payment_reqs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pre_payment_reqs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pre_payment_req" do
    assert_difference('PrePaymentReq.count') do
      post :create, pre_payment_req: { amount: @pre_payment_req.amount, billing_info_id: @pre_payment_req.billing_info_id, reference: @pre_payment_req.reference }
    end

    assert_redirected_to pre_payment_req_path(assigns(:pre_payment_req))
  end

  test "should show pre_payment_req" do
    get :show, id: @pre_payment_req
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pre_payment_req
    assert_response :success
  end

  test "should update pre_payment_req" do
    patch :update, id: @pre_payment_req, pre_payment_req: { amount: @pre_payment_req.amount, billing_info_id: @pre_payment_req.billing_info_id, reference: @pre_payment_req.reference }
    assert_redirected_to pre_payment_req_path(assigns(:pre_payment_req))
  end

  test "should destroy pre_payment_req" do
    assert_difference('PrePaymentReq.count', -1) do
      delete :destroy, id: @pre_payment_req
    end

    assert_redirected_to pre_payment_reqs_path
  end
end
