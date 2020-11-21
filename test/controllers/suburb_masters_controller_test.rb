require 'test_helper'

class SuburbMastersControllerTest < ActionController::TestCase
  setup do
    @suburb_master = suburb_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:suburb_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create suburb_master" do
    assert_difference('SuburbMaster.count') do
      post :create, suburb_master: { active_status: @suburb_master.active_status, city_town_id: @suburb_master.city_town_id, comment: @suburb_master.comment, del_status: @suburb_master.del_status, entity_id: @suburb_master.entity_id, suburb_name: @suburb_master.suburb_name, user_id: @suburb_master.user_id }
    end

    assert_redirected_to suburb_master_path(assigns(:suburb_master))
  end

  test "should show suburb_master" do
    get :show, id: @suburb_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @suburb_master
    assert_response :success
  end

  test "should update suburb_master" do
    patch :update, id: @suburb_master, suburb_master: { active_status: @suburb_master.active_status, city_town_id: @suburb_master.city_town_id, comment: @suburb_master.comment, del_status: @suburb_master.del_status, entity_id: @suburb_master.entity_id, suburb_name: @suburb_master.suburb_name, user_id: @suburb_master.user_id }
    assert_redirected_to suburb_master_path(assigns(:suburb_master))
  end

  test "should destroy suburb_master" do
    assert_difference('SuburbMaster.count', -1) do
      delete :destroy, id: @suburb_master
    end

    assert_redirected_to suburb_masters_path
  end
end
