require 'test_helper'

class PdsPatientPrevMedHistoriesControllerTest < ActionController::TestCase
  setup do
    @pds_patient_prev_med_history = pds_patient_prev_med_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pds_patient_prev_med_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pds_patient_prev_med_history" do
    assert_difference('PdsPatientPrevMedHistory.count') do
      post :create, pds_patient_prev_med_history: { active_status: @pds_patient_prev_med_history.active_status, confirmed_pds_id: @pds_patient_prev_med_history.confirmed_pds_id, del_status: @pds_patient_prev_med_history.del_status, prev_med_histry: @pds_patient_prev_med_history.prev_med_histry, user_id: @pds_patient_prev_med_history.user_id }
    end

    assert_redirected_to pds_patient_prev_med_history_path(assigns(:pds_patient_prev_med_history))
  end

  test "should show pds_patient_prev_med_history" do
    get :show, id: @pds_patient_prev_med_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pds_patient_prev_med_history
    assert_response :success
  end

  test "should update pds_patient_prev_med_history" do
    patch :update, id: @pds_patient_prev_med_history, pds_patient_prev_med_history: { active_status: @pds_patient_prev_med_history.active_status, confirmed_pds_id: @pds_patient_prev_med_history.confirmed_pds_id, del_status: @pds_patient_prev_med_history.del_status, prev_med_histry: @pds_patient_prev_med_history.prev_med_histry, user_id: @pds_patient_prev_med_history.user_id }
    assert_redirected_to pds_patient_prev_med_history_path(assigns(:pds_patient_prev_med_history))
  end

  test "should destroy pds_patient_prev_med_history" do
    assert_difference('PdsPatientPrevMedHistory.count', -1) do
      delete :destroy, id: @pds_patient_prev_med_history
    end

    assert_redirected_to pds_patient_prev_med_histories_path
  end
end
