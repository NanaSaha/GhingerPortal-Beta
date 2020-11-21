require 'test_helper'

class ConditionMastersControllerTest < ActionController::TestCase
  setup do
    @condition_master = condition_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:condition_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create condition_master" do
    assert_difference('ConditionMaster.count') do
      post :create, condition_master: { active_status: @condition_master.active_status, comment: @condition_master.comment, condition_name: @condition_master.condition_name, del_status: @condition_master.del_status, user_id: @condition_master.user_id }
    end

    assert_redirected_to condition_master_path(assigns(:condition_master))
  end

  test "should show condition_master" do
    get :show, id: @condition_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @condition_master
    assert_response :success
  end

  test "should update condition_master" do
    patch :update, id: @condition_master, condition_master: { active_status: @condition_master.active_status, comment: @condition_master.comment, condition_name: @condition_master.condition_name, del_status: @condition_master.del_status, user_id: @condition_master.user_id }
    assert_redirected_to condition_master_path(assigns(:condition_master))
  end

  test "should destroy condition_master" do
    assert_difference('ConditionMaster.count', -1) do
      delete :destroy, id: @condition_master
    end

    assert_redirected_to condition_masters_path
  end
end
