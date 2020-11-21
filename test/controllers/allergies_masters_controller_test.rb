require 'test_helper'

class AllergiesMastersControllerTest < ActionController::TestCase
  setup do
    @allergies_master = allergies_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:allergies_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create allergies_master" do
    assert_difference('AllergiesMaster.count') do
      post :create, allergies_master: { active_status: @allergies_master.active_status, comment: @allergies_master.comment, del_status: @allergies_master.del_status, entity: @allergies_master.entity, title: @allergies_master.title, user_id: @allergies_master.user_id }
    end

    assert_redirected_to allergies_master_path(assigns(:allergies_master))
  end

  test "should show allergies_master" do
    get :show, id: @allergies_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @allergies_master
    assert_response :success
  end

  test "should update allergies_master" do
    patch :update, id: @allergies_master, allergies_master: { active_status: @allergies_master.active_status, comment: @allergies_master.comment, del_status: @allergies_master.del_status, entity: @allergies_master.entity, title: @allergies_master.title, user_id: @allergies_master.user_id }
    assert_redirected_to allergies_master_path(assigns(:allergies_master))
  end

  test "should destroy allergies_master" do
    assert_difference('AllergiesMaster.count', -1) do
      delete :destroy, id: @allergies_master
    end

    assert_redirected_to allergies_masters_path
  end
end
