require 'test_helper'

class AffectedSystemMastersControllerTest < ActionController::TestCase
  setup do
    @affected_system_master = affected_system_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:affected_system_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create affected_system_master" do
    assert_difference('AffectedSystemMaster.count') do
      post :create, affected_system_master: { active_status: @affected_system_master.active_status, comment: @affected_system_master.comment, del_status: @affected_system_master.del_status, entity_id: @affected_system_master.entity_id, title: @affected_system_master.title, user_id: @affected_system_master.user_id }
    end

    assert_redirected_to affected_system_master_path(assigns(:affected_system_master))
  end

  test "should show affected_system_master" do
    get :show, id: @affected_system_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @affected_system_master
    assert_response :success
  end

  test "should update affected_system_master" do
    patch :update, id: @affected_system_master, affected_system_master: { active_status: @affected_system_master.active_status, comment: @affected_system_master.comment, del_status: @affected_system_master.del_status, entity_id: @affected_system_master.entity_id, title: @affected_system_master.title, user_id: @affected_system_master.user_id }
    assert_redirected_to affected_system_master_path(assigns(:affected_system_master))
  end

  test "should destroy affected_system_master" do
    assert_difference('AffectedSystemMaster.count', -1) do
      delete :destroy, id: @affected_system_master
    end

    assert_redirected_to affected_system_masters_path
  end
end
