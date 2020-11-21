require 'test_helper'

class RequestCategoriesControllerTest < ActionController::TestCase
  setup do
    @request_category = request_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_category" do
    assert_difference('RequestCategory.count') do
      post :create, request_category: { category: @request_category.category, ref_id: @request_category.ref_id }
    end

    assert_redirected_to request_category_path(assigns(:request_category))
  end

  test "should show request_category" do
    get :show, id: @request_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_category
    assert_response :success
  end

  test "should update request_category" do
    patch :update, id: @request_category, request_category: { category: @request_category.category, ref_id: @request_category.ref_id }
    assert_redirected_to request_category_path(assigns(:request_category))
  end

  test "should destroy request_category" do
    assert_difference('RequestCategory.count', -1) do
      delete :destroy, id: @request_category
    end

    assert_redirected_to request_categories_path
  end
end
