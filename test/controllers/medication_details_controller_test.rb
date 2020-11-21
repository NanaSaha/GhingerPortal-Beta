require 'test_helper'

class MedicationDetailsControllerTest < ActionController::TestCase
  setup do
    @medication_detail = medication_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medication_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medication_detail" do
    assert_difference('MedicationDetail.count') do
      post :create, medication_detail: { active_status: @medication_detail.active_status, comment: @medication_detail.comment, confirmed_appt_id: @medication_detail.confirmed_appt_id, del_status: @medication_detail.del_status, drug_id: @medication_detail.drug_id, user_id: @medication_detail.user_id }
    end

    assert_redirected_to medication_detail_path(assigns(:medication_detail))
  end

  test "should show medication_detail" do
    get :show, id: @medication_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medication_detail
    assert_response :success
  end

  test "should update medication_detail" do
    patch :update, id: @medication_detail, medication_detail: { active_status: @medication_detail.active_status, comment: @medication_detail.comment, confirmed_appt_id: @medication_detail.confirmed_appt_id, del_status: @medication_detail.del_status, drug_id: @medication_detail.drug_id, user_id: @medication_detail.user_id }
    assert_redirected_to medication_detail_path(assigns(:medication_detail))
  end

  test "should destroy medication_detail" do
    assert_difference('MedicationDetail.count', -1) do
      delete :destroy, id: @medication_detail
    end

    assert_redirected_to medication_details_path
  end
end
