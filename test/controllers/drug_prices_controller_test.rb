require 'test_helper'

class DrugPricesControllerTest < ActionController::TestCase
  setup do
    @drug_price = drug_prices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drug_prices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create drug_price" do
    assert_difference('DrugPrice.count') do
      post :create, drug_price: { active_status: @drug_price.active_status, comment: @drug_price.comment, del_status: @drug_price.del_status, drug_id: @drug_price.drug_id, price: @drug_price.price, unit_id: @drug_price.unit_id, user_id: @drug_price.user_id }
    end

    assert_redirected_to drug_price_path(assigns(:drug_price))
  end

  test "should show drug_price" do
    get :show, id: @drug_price
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @drug_price
    assert_response :success
  end

  test "should update drug_price" do
    patch :update, id: @drug_price, drug_price: { active_status: @drug_price.active_status, comment: @drug_price.comment, del_status: @drug_price.del_status, drug_id: @drug_price.drug_id, price: @drug_price.price, unit_id: @drug_price.unit_id, user_id: @drug_price.user_id }
    assert_redirected_to drug_price_path(assigns(:drug_price))
  end

  test "should destroy drug_price" do
    assert_difference('DrugPrice.count', -1) do
      delete :destroy, id: @drug_price
    end

    assert_redirected_to drug_prices_path
  end
end
