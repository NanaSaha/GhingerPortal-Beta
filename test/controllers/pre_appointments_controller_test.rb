require 'test_helper'

class PreAppointmentsControllerTest < ActionController::TestCase
  setup do
    @pre_appointment = pre_appointments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pre_appointments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pre_appointment" do
    assert_difference('PreAppointment.count') do
      post :create, pre_appointment: { active_status: @pre_appointment.active_status, appointment_type_id: @pre_appointment.appointment_type_id, beneficiary_name: @pre_appointment.beneficiary_name, comment: @pre_appointment.comment, complaint_desc: @pre_appointment.complaint_desc, del_status: @pre_appointment.del_status, prev_medical_history: @pre_appointment.prev_medical_history, proposed_date: @pre_appointment.proposed_date, proposed_time: @pre_appointment.proposed_time, provider_id: @pre_appointment.provider_id, req_urgency: @pre_appointment.req_urgency, requester_cat: @pre_appointment.requester_cat, requester_id: @pre_appointment.requester_id, user_id: @pre_appointment.user_id }
    end

    assert_redirected_to pre_appointment_path(assigns(:pre_appointment))
  end

  test "should show pre_appointment" do
    get :show, id: @pre_appointment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pre_appointment
    assert_response :success
  end

  test "should update pre_appointment" do
    patch :update, id: @pre_appointment, pre_appointment: { active_status: @pre_appointment.active_status, appointment_type_id: @pre_appointment.appointment_type_id, beneficiary_name: @pre_appointment.beneficiary_name, comment: @pre_appointment.comment, complaint_desc: @pre_appointment.complaint_desc, del_status: @pre_appointment.del_status, prev_medical_history: @pre_appointment.prev_medical_history, proposed_date: @pre_appointment.proposed_date, proposed_time: @pre_appointment.proposed_time, provider_id: @pre_appointment.provider_id, req_urgency: @pre_appointment.req_urgency, requester_cat: @pre_appointment.requester_cat, requester_id: @pre_appointment.requester_id, user_id: @pre_appointment.user_id }
    assert_redirected_to pre_appointment_path(assigns(:pre_appointment))
  end

  test "should destroy pre_appointment" do
    assert_difference('PreAppointment.count', -1) do
      delete :destroy, id: @pre_appointment
    end

    assert_redirected_to pre_appointments_path
  end
end
