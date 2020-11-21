require 'test_helper'

class RequesterAllergiesControllerTest < ActionController::TestCase
  setup do
    @requester_allergy = requester_allergies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requester_allergies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requester_allergy" do
    assert_difference('RequesterAllergy.count') do
      post :create, requester_allergy: { active_status: @requester_allergy.active_status, allergy_id: @requester_allergy.allergy_id, comment: @requester_allergy.comment, del_status: @requester_allergy.del_status, pre_appointment_id: @requester_allergy.pre_appointment_id, user_id: @requester_allergy.user_id }
    end

    assert_redirected_to requester_allergy_path(assigns(:requester_allergy))
  end

  test "should show requester_allergy" do
    get :show, id: @requester_allergy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @requester_allergy
    assert_response :success
  end

  test "should update requester_allergy" do
    patch :update, id: @requester_allergy, requester_allergy: { active_status: @requester_allergy.active_status, allergy_id: @requester_allergy.allergy_id, comment: @requester_allergy.comment, del_status: @requester_allergy.del_status, pre_appointment_id: @requester_allergy.pre_appointment_id, user_id: @requester_allergy.user_id }
    assert_redirected_to requester_allergy_path(assigns(:requester_allergy))
  end

  test "should destroy requester_allergy" do
    assert_difference('RequesterAllergy.count', -1) do
      delete :destroy, id: @requester_allergy
    end

    assert_redirected_to requester_allergies_path
  end
end
