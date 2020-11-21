require 'test_helper'

class PersonTypeMastersControllerTest < ActionController::TestCase
  setup do
    @person_type_master = person_type_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:person_type_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person_type_master" do
    assert_difference('PersonTypeMaster.count') do
      post :create, person_type_master: { active_status: @person_type_master.active_status, comment: @person_type_master.comment, del_status: @person_type_master.del_status, entity: @person_type_master.entity, user_id: @person_type_master.user_id, user_type_title: @person_type_master.user_type_title }
    end

    assert_redirected_to person_type_master_path(assigns(:person_type_master))
  end

  test "should show person_type_master" do
    get :show, id: @person_type_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person_type_master
    assert_response :success
  end

  test "should update person_type_master" do
    patch :update, id: @person_type_master, person_type_master: { active_status: @person_type_master.active_status, comment: @person_type_master.comment, del_status: @person_type_master.del_status, entity: @person_type_master.entity, user_id: @person_type_master.user_id, user_type_title: @person_type_master.user_type_title }
    assert_redirected_to person_type_master_path(assigns(:person_type_master))
  end

  test "should destroy person_type_master" do
    assert_difference('PersonTypeMaster.count', -1) do
      delete :destroy, id: @person_type_master
    end

    assert_redirected_to person_type_masters_path
  end
end
