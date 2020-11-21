require 'test_helper'

class ProfesionalGroupsControllerTest < ActionController::TestCase
  setup do
    @profesional_group = profesional_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profesional_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profesional_group" do
    assert_difference('ProfesionalGroup.count') do
      post :create, profesional_group: { active_status: @profesional_group.active_status, comment: @profesional_group.comment, del_status: @profesional_group.del_status, entity_id: @profesional_group.entity_id, group_name: @profesional_group.group_name, user_id: @profesional_group.user_id }
    end

    assert_redirected_to profesional_group_path(assigns(:profesional_group))
  end

  test "should show profesional_group" do
    get :show, id: @profesional_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profesional_group
    assert_response :success
  end

  test "should update profesional_group" do
    patch :update, id: @profesional_group, profesional_group: { active_status: @profesional_group.active_status, comment: @profesional_group.comment, del_status: @profesional_group.del_status, entity_id: @profesional_group.entity_id, group_name: @profesional_group.group_name, user_id: @profesional_group.user_id }
    assert_redirected_to profesional_group_path(assigns(:profesional_group))
  end

  test "should destroy profesional_group" do
    assert_difference('ProfesionalGroup.count', -1) do
      delete :destroy, id: @profesional_group
    end

    assert_redirected_to profesional_groups_path
  end
end
