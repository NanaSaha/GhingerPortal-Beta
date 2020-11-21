require 'test_helper'

class ProviderMastersControllerTest < ActionController::TestCase
  setup do
    @provider_master = provider_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:provider_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create provider_master" do
    assert_difference('ProviderMaster.count') do
      post :create, provider_master: { active_status: @provider_master.active_status, alias: @provider_master.alias, change_status: @provider_master.change_status, comment: @provider_master.comment, entity_id: @provider_master.entity_id, provider_name: @provider_master.provider_name, provider_type_id: @provider_master.provider_type_id, user_id: @provider_master.user_id }
    end

    assert_redirected_to provider_master_path(assigns(:provider_master))
  end

  test "should show provider_master" do
    get :show, id: @provider_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @provider_master
    assert_response :success
  end

  test "should update provider_master" do
    patch :update, id: @provider_master, provider_master: { active_status: @provider_master.active_status, alias: @provider_master.alias, change_status: @provider_master.change_status, comment: @provider_master.comment, entity_id: @provider_master.entity_id, provider_name: @provider_master.provider_name, provider_type_id: @provider_master.provider_type_id, user_id: @provider_master.user_id }
    assert_redirected_to provider_master_path(assigns(:provider_master))
  end

  test "should destroy provider_master" do
    assert_difference('ProviderMaster.count', -1) do
      delete :destroy, id: @provider_master
    end

    assert_redirected_to provider_masters_path
  end
end
