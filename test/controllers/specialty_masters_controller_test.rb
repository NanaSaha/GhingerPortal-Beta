require 'test_helper'

class SpecialtyMastersControllerTest < ActionController::TestCase
  setup do
    @specialty_master = specialty_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specialty_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create specialty_master" do
    assert_difference('SpecialtyMaster.count') do
      post :create, specialty_master: { active_status: @specialty_master.active_status, alias: @specialty_master.alias, comment: @specialty_master.comment, del_status: @specialty_master.del_status, entity_id: @specialty_master.entity_id, title: @specialty_master.title, user_id: @specialty_master.user_id }
    end

    assert_redirected_to specialty_master_path(assigns(:specialty_master))
  end

  test "should show specialty_master" do
    get :show, id: @specialty_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @specialty_master
    assert_response :success
  end

  test "should update specialty_master" do
    patch :update, id: @specialty_master, specialty_master: { active_status: @specialty_master.active_status, alias: @specialty_master.alias, comment: @specialty_master.comment, del_status: @specialty_master.del_status, entity_id: @specialty_master.entity_id, title: @specialty_master.title, user_id: @specialty_master.user_id }
    assert_redirected_to specialty_master_path(assigns(:specialty_master))
  end

  test "should destroy specialty_master" do
    assert_difference('SpecialtyMaster.count', -1) do
      delete :destroy, id: @specialty_master
    end

    assert_redirected_to specialty_masters_path
  end
end
