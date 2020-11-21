require 'test_helper'

class PreConfirmedAppointmentsControllerTest < ActionController::TestCase
  setup do
    @pre_confirmed_appointment = pre_confirmed_appointments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pre_confirmed_appointments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pre_confirmed_appointment" do
    assert_difference('PreConfirmedAppointment.count') do
      post :create, pre_confirmed_appointment: { active_status: @pre_confirmed_appointment.active_status, appointment_id: @pre_confirmed_appointment.appointment_id, del_status: @pre_confirmed_appointment.del_status, doctor_id: @pre_confirmed_appointment.doctor_id, nurse_id: @pre_confirmed_appointment.nurse_id, user_id: @pre_confirmed_appointment.user_id }
    end

    assert_redirected_to pre_confirmed_appointment_path(assigns(:pre_confirmed_appointment))
  end

  test "should show pre_confirmed_appointment" do
    get :show, id: @pre_confirmed_appointment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pre_confirmed_appointment
    assert_response :success
  end

  test "should update pre_confirmed_appointment" do
    patch :update, id: @pre_confirmed_appointment, pre_confirmed_appointment: { active_status: @pre_confirmed_appointment.active_status, appointment_id: @pre_confirmed_appointment.appointment_id, del_status: @pre_confirmed_appointment.del_status, doctor_id: @pre_confirmed_appointment.doctor_id, nurse_id: @pre_confirmed_appointment.nurse_id, user_id: @pre_confirmed_appointment.user_id }
    assert_redirected_to pre_confirmed_appointment_path(assigns(:pre_confirmed_appointment))
  end

  test "should destroy pre_confirmed_appointment" do
    assert_difference('PreConfirmedAppointment.count', -1) do
      delete :destroy, id: @pre_confirmed_appointment
    end

    assert_redirected_to pre_confirmed_appointments_path
  end
end
