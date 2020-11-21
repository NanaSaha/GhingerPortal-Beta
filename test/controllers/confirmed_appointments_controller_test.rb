require 'test_helper'

class ConfirmedAppointmentsControllerTest < ActionController::TestCase
  setup do
    @confirmed_appointment = confirmed_appointments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:confirmed_appointments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create confirmed_appointment" do
    assert_difference('ConfirmedAppointment.count') do
      post :create, confirmed_appointment: { active_status: @confirmed_appointment.active_status, comment: @confirmed_appointment.comment, complaint_desc: @confirmed_appointment.complaint_desc, confirmed_date: @confirmed_appointment.confirmed_date, confirmed_time: @confirmed_appointment.confirmed_time, del_status: @confirmed_appointment.del_status, entity_id: @confirmed_appointment.entity_id, pre_appointment_id: @confirmed_appointment.pre_appointment_id, provider_id: @confirmed_appointment.provider_id, user_id: @confirmed_appointment.user_id }
    end

    assert_redirected_to confirmed_appointment_path(assigns(:confirmed_appointment))
  end

  test "should show confirmed_appointment" do
    get :show, id: @confirmed_appointment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @confirmed_appointment
    assert_response :success
  end

  test "should update confirmed_appointment" do
    patch :update, id: @confirmed_appointment, confirmed_appointment: { active_status: @confirmed_appointment.active_status, comment: @confirmed_appointment.comment, complaint_desc: @confirmed_appointment.complaint_desc, confirmed_date: @confirmed_appointment.confirmed_date, confirmed_time: @confirmed_appointment.confirmed_time, del_status: @confirmed_appointment.del_status, entity_id: @confirmed_appointment.entity_id, pre_appointment_id: @confirmed_appointment.pre_appointment_id, provider_id: @confirmed_appointment.provider_id, user_id: @confirmed_appointment.user_id }
    assert_redirected_to confirmed_appointment_path(assigns(:confirmed_appointment))
  end

  test "should destroy confirmed_appointment" do
    assert_difference('ConfirmedAppointment.count', -1) do
      delete :destroy, id: @confirmed_appointment
    end

    assert_redirected_to confirmed_appointments_path
  end
end
