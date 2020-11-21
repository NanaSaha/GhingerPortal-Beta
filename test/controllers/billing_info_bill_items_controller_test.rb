require 'test_helper'

class BillingInfoBillItemsControllerTest < ActionController::TestCase
  setup do
    @billing_info_bill_item = billing_info_bill_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:billing_info_bill_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create billing_info_bill_item" do
    assert_difference('BillingInfoBillItem.count') do
      post :create, billing_info_bill_item: { active_status: @billing_info_bill_item.active_status, billing_info_id: @billing_info_bill_item.billing_info_id, comment: @billing_info_bill_item.comment, del_status: @billing_info_bill_item.del_status, item_id: @billing_info_bill_item.item_id, item_price: @billing_info_bill_item.item_price, item_price: @billing_info_bill_item.item_price, quantity: @billing_info_bill_item.quantity, user_id: @billing_info_bill_item.user_id }
    end

    assert_redirected_to billing_info_bill_item_path(assigns(:billing_info_bill_item))
  end

  test "should show billing_info_bill_item" do
    get :show, id: @billing_info_bill_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @billing_info_bill_item
    assert_response :success
  end

  test "should update billing_info_bill_item" do
    patch :update, id: @billing_info_bill_item, billing_info_bill_item: { active_status: @billing_info_bill_item.active_status, billing_info_id: @billing_info_bill_item.billing_info_id, comment: @billing_info_bill_item.comment, del_status: @billing_info_bill_item.del_status, item_id: @billing_info_bill_item.item_id, item_price: @billing_info_bill_item.item_price, item_price: @billing_info_bill_item.item_price, quantity: @billing_info_bill_item.quantity, user_id: @billing_info_bill_item.user_id }
    assert_redirected_to billing_info_bill_item_path(assigns(:billing_info_bill_item))
  end

  test "should destroy billing_info_bill_item" do
    assert_difference('BillingInfoBillItem.count', -1) do
      delete :destroy, id: @billing_info_bill_item
    end

    assert_redirected_to billing_info_bill_items_path
  end
end
