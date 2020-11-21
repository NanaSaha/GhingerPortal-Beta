require 'test_helper'

class ReferalsControllerTest < ActionController::TestCase
  setup do
    @referal = referals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:referals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create referal" do
    assert_difference('Referal.count') do
      post :create, referal: { active_status: @referal.active_status, contact: @referal.contact, del_status: @referal.del_status, dob: @referal.dob, other_names: @referal.other_names, refered_by: @referal.refered_by, surname: @referal.surname, user_id: @referal.user_id }
    end

    assert_redirected_to referal_path(assigns(:referal))
  end

  test "should show referal" do
    get :show, id: @referal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @referal
    assert_response :success
  end

  test "should update referal" do
    patch :update, id: @referal, referal: { active_status: @referal.active_status, contact: @referal.contact, del_status: @referal.del_status, dob: @referal.dob, other_names: @referal.other_names, refered_by: @referal.refered_by, surname: @referal.surname, user_id: @referal.user_id }
    assert_redirected_to referal_path(assigns(:referal))
  end

  test "should destroy referal" do
    assert_difference('Referal.count', -1) do
      delete :destroy, id: @referal
    end

    assert_redirected_to referals_path
  end
end
