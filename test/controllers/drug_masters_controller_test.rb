require 'test_helper'

class DrugMastersControllerTest < ActionController::TestCase
  setup do
    @drug_master = drug_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drug_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create drug_master" do
    assert_difference('DrugMaster.count') do
      post :create, drug_master: { active_status: @drug_master.active_status, comment: @drug_master.comment, del_status: @drug_master.del_status, drug_alias: @drug_master.drug_alias, drug_name: @drug_master.drug_name, user_id: @drug_master.user_id }
    end

    assert_redirected_to drug_master_path(assigns(:drug_master))
  end

  test "should show drug_master" do
    get :show, id: @drug_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @drug_master
    assert_response :success
  end

  test "should update drug_master" do
    patch :update, id: @drug_master, drug_master: { active_status: @drug_master.active_status, comment: @drug_master.comment, del_status: @drug_master.del_status, drug_alias: @drug_master.drug_alias, drug_name: @drug_master.drug_name, user_id: @drug_master.user_id }
    assert_redirected_to drug_master_path(assigns(:drug_master))
  end

  test "should destroy drug_master" do
    assert_difference('DrugMaster.count', -1) do
      delete :destroy, id: @drug_master
    end

    assert_redirected_to drug_masters_path
  end
end
