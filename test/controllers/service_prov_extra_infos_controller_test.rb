require 'test_helper'

class ServiceProvExtraInfosControllerTest < ActionController::TestCase
  setup do
    @service_prov_extra_info = service_prov_extra_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_prov_extra_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_prov_extra_info" do
    assert_difference('ServiceProvExtraInfo.count') do
      post :create, service_prov_extra_info: { active_status: @service_prov_extra_info.active_status, comment: @service_prov_extra_info.comment, contact_number1: @service_prov_extra_info.contact_number1, contact_number2: @service_prov_extra_info.contact_number2, contact_person_name: @service_prov_extra_info.contact_person_name, del_status: @service_prov_extra_info.del_status, entity_id: @service_prov_extra_info.entity_id, latitude: @service_prov_extra_info.latitude, location_address: @service_prov_extra_info.location_address, longitude: @service_prov_extra_info.longitude, postal_address: @service_prov_extra_info.postal_address, service_prov_id: @service_prov_extra_info.service_prov_id, suburb_id: @service_prov_extra_info.suburb_id, user_id: @service_prov_extra_info.user_id, web_url: @service_prov_extra_info.web_url }
    end

    assert_redirected_to service_prov_extra_info_path(assigns(:service_prov_extra_info))
  end

  test "should show service_prov_extra_info" do
    get :show, id: @service_prov_extra_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_prov_extra_info
    assert_response :success
  end

  test "should update service_prov_extra_info" do
    patch :update, id: @service_prov_extra_info, service_prov_extra_info: { active_status: @service_prov_extra_info.active_status, comment: @service_prov_extra_info.comment, contact_number1: @service_prov_extra_info.contact_number1, contact_number2: @service_prov_extra_info.contact_number2, contact_person_name: @service_prov_extra_info.contact_person_name, del_status: @service_prov_extra_info.del_status, entity_id: @service_prov_extra_info.entity_id, latitude: @service_prov_extra_info.latitude, location_address: @service_prov_extra_info.location_address, longitude: @service_prov_extra_info.longitude, postal_address: @service_prov_extra_info.postal_address, service_prov_id: @service_prov_extra_info.service_prov_id, suburb_id: @service_prov_extra_info.suburb_id, user_id: @service_prov_extra_info.user_id, web_url: @service_prov_extra_info.web_url }
    assert_redirected_to service_prov_extra_info_path(assigns(:service_prov_extra_info))
  end

  test "should destroy service_prov_extra_info" do
    assert_difference('ServiceProvExtraInfo.count', -1) do
      delete :destroy, id: @service_prov_extra_info
    end

    assert_redirected_to service_prov_extra_infos_path
  end
end
