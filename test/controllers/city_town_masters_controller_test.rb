require 'test_helper'

class CityTownMastersControllerTest < ActionController::TestCase
  setup do
    @city_town_master = city_town_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:city_town_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create city_town_master" do
    assert_difference('CityTownMaster.count') do
      post :create, city_town_master: { active_status: @city_town_master.active_status, city_town_name: @city_town_master.city_town_name, comment: @city_town_master.comment, del_status: @city_town_master.del_status, entity_id: @city_town_master.entity_id, region_id: @city_town_master.region_id, user_id: @city_town_master.user_id }
    end

    assert_redirected_to city_town_master_path(assigns(:city_town_master))
  end

  test "should show city_town_master" do
    get :show, id: @city_town_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @city_town_master
    assert_response :success
  end

  test "should update city_town_master" do
    patch :update, id: @city_town_master, city_town_master: { active_status: @city_town_master.active_status, city_town_name: @city_town_master.city_town_name, comment: @city_town_master.comment, del_status: @city_town_master.del_status, entity_id: @city_town_master.entity_id, region_id: @city_town_master.region_id, user_id: @city_town_master.user_id }
    assert_redirected_to city_town_master_path(assigns(:city_town_master))
  end

  test "should destroy city_town_master" do
    assert_difference('CityTownMaster.count', -1) do
      delete :destroy, id: @city_town_master
    end

    assert_redirected_to city_town_masters_path
  end
end
