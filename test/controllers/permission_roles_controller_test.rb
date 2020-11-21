require 'test_helper'

class PermissionRolesControllerTest < ActionController::TestCase
  setup do
    @permission_role = permission_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:permission_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create permission_role" do
    assert_difference('PermissionRole.count') do
      post :create, permission_role: { permission_id: @permission_role.permission_id, person_type_master_id: @permission_role.person_type_master_id }
    end

    assert_redirected_to permission_role_path(assigns(:permission_role))
  end

  test "should show permission_role" do
    get :show, id: @permission_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @permission_role
    assert_response :success
  end

  test "should update permission_role" do
    patch :update, id: @permission_role, permission_role: { permission_id: @permission_role.permission_id, person_type_master_id: @permission_role.person_type_master_id }
    assert_redirected_to permission_role_path(assigns(:permission_role))
  end

  test "should destroy permission_role" do
    assert_difference('PermissionRole.count', -1) do
      delete :destroy, id: @permission_role
    end

    assert_redirected_to permission_roles_path
  end
end
