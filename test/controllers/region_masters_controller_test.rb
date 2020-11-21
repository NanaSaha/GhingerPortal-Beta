require 'test_helper'

class RegionMastersControllerTest < ActionController::TestCase
  setup do
    @region_master = region_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:region_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create region_master" do
    assert_difference('RegionMaster.count') do
      post :create, region_master: { active_status: @region_master.active_status, comment: @region_master.comment, country_id: @region_master.country_id, del_status: @region_master.del_status, entity_id: @region_master.entity_id, region_state_name: @region_master.region_state_name, user_id: @region_master.user_id }
    end

    assert_redirected_to region_master_path(assigns(:region_master))
  end

  test "should show region_master" do
    get :show, id: @region_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @region_master
    assert_response :success
  end

  test "should update region_master" do
    patch :update, id: @region_master, region_master: { active_status: @region_master.active_status, comment: @region_master.comment, country_id: @region_master.country_id, del_status: @region_master.del_status, entity_id: @region_master.entity_id, region_state_name: @region_master.region_state_name, user_id: @region_master.user_id }
    assert_redirected_to region_master_path(assigns(:region_master))
  end

  test "should destroy region_master" do
    assert_difference('RegionMaster.count', -1) do
      delete :destroy, id: @region_master
    end

    assert_redirected_to region_masters_path
  end
end
