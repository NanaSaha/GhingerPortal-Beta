require 'test_helper'

class ConfirmedConditionsControllerTest < ActionController::TestCase
  setup do
    @confirmed_condition = confirmed_conditions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:confirmed_conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create confirmed_condition" do
    assert_difference('ConfirmedCondition.count') do
      post :create, confirmed_condition: { active_status: @confirmed_condition.active_status, allergy_id: @confirmed_condition.allergy_id, comment: @confirmed_condition.comment, condition_id: @confirmed_condition.condition_id, confirmed_appointment_id: @confirmed_condition.confirmed_appointment_id, del_status: @confirmed_condition.del_status, entity: @confirmed_condition.entity, user_id: @confirmed_condition.user_id }
    end

    assert_redirected_to confirmed_condition_path(assigns(:confirmed_condition))
  end

  test "should show confirmed_condition" do
    get :show, id: @confirmed_condition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @confirmed_condition
    assert_response :success
  end

  test "should update confirmed_condition" do
    patch :update, id: @confirmed_condition, confirmed_condition: { active_status: @confirmed_condition.active_status, allergy_id: @confirmed_condition.allergy_id, comment: @confirmed_condition.comment, condition_id: @confirmed_condition.condition_id, confirmed_appointment_id: @confirmed_condition.confirmed_appointment_id, del_status: @confirmed_condition.del_status, entity: @confirmed_condition.entity, user_id: @confirmed_condition.user_id }
    assert_redirected_to confirmed_condition_path(assigns(:confirmed_condition))
  end

  test "should destroy confirmed_condition" do
    assert_difference('ConfirmedCondition.count', -1) do
      delete :destroy, id: @confirmed_condition
    end

    assert_redirected_to confirmed_conditions_path
  end
end
