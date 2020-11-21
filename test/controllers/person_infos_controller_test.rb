require 'test_helper'

class PersonInfosControllerTest < ActionController::TestCase
  setup do
    @person_info = person_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:person_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person_info" do
    assert_difference('PersonInfo.count') do
      post :create, person_info: { active_status: @person_info.active_status, del_status: @person_info.del_status, entity_id: @person_info.entity_id, other_names: @person_info.other_names, person_type_id: @person_info.person_type_id, surname: @person_info.surname, user_id: @person_info.user_id }
    end

    assert_redirected_to person_info_path(assigns(:person_info))
  end

  test "should show person_info" do
    get :show, id: @person_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person_info
    assert_response :success
  end

  test "should update person_info" do
    patch :update, id: @person_info, person_info: { active_status: @person_info.active_status, del_status: @person_info.del_status, entity_id: @person_info.entity_id, other_names: @person_info.other_names, person_type_id: @person_info.person_type_id, surname: @person_info.surname, user_id: @person_info.user_id }
    assert_redirected_to person_info_path(assigns(:person_info))
  end

  test "should destroy person_info" do
    assert_difference('PersonInfo.count', -1) do
      delete :destroy, id: @person_info
    end

    assert_redirected_to person_infos_path
  end
end
