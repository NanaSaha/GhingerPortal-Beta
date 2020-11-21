require 'test_helper'

class CountryMastersControllerTest < ActionController::TestCase
  setup do
    @country_master = country_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:country_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create country_master" do
    assert_difference('CountryMaster.count') do
      post :create, country_master: { active_status: @country_master.active_status, comment: @country_master.comment, country_name: @country_master.country_name, del_status: @country_master.del_status, entity_id: @country_master.entity_id, user_id: @country_master.user_id }
    end

    assert_redirected_to country_master_path(assigns(:country_master))
  end

  test "should show country_master" do
    get :show, id: @country_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @country_master
    assert_response :success
  end

  test "should update country_master" do
    patch :update, id: @country_master, country_master: { active_status: @country_master.active_status, comment: @country_master.comment, country_name: @country_master.country_name, del_status: @country_master.del_status, entity_id: @country_master.entity_id, user_id: @country_master.user_id }
    assert_redirected_to country_master_path(assigns(:country_master))
  end

  test "should destroy country_master" do
    assert_difference('CountryMaster.count', -1) do
      delete :destroy, id: @country_master
    end

    assert_redirected_to country_masters_path
  end
end
