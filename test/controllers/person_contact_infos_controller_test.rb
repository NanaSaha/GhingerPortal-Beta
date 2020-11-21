require 'test_helper'

class PersonContactInfosControllerTest < ActionController::TestCase
  setup do
    @person_contact_info = person_contact_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:person_contact_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person_contact_info" do
    assert_difference('PersonContactInfo.count') do
      post :create, person_contact_info: { active_status: @person_contact_info.active_status, comment: @person_contact_info.comment, contact_number: @person_contact_info.contact_number, del_status: @person_contact_info.del_status, email: @person_contact_info.email, entity_id: @person_contact_info.entity_id, location_address: @person_contact_info.location_address, person_id: @person_contact_info.person_id, postal_address: @person_contact_info.postal_address, user_id: @person_contact_info.user_id }
    end

    assert_redirected_to person_contact_info_path(assigns(:person_contact_info))
  end

  test "should show person_contact_info" do
    get :show, id: @person_contact_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person_contact_info
    assert_response :success
  end

  test "should update person_contact_info" do
    patch :update, id: @person_contact_info, person_contact_info: { active_status: @person_contact_info.active_status, comment: @person_contact_info.comment, contact_number: @person_contact_info.contact_number, del_status: @person_contact_info.del_status, email: @person_contact_info.email, entity_id: @person_contact_info.entity_id, location_address: @person_contact_info.location_address, person_id: @person_contact_info.person_id, postal_address: @person_contact_info.postal_address, user_id: @person_contact_info.user_id }
    assert_redirected_to person_contact_info_path(assigns(:person_contact_info))
  end

  test "should destroy person_contact_info" do
    assert_difference('PersonContactInfo.count', -1) do
      delete :destroy, id: @person_contact_info
    end

    assert_redirected_to person_contact_infos_path
  end
end
