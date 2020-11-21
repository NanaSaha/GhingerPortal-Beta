require 'test_helper'

class ProviderEngagedUsersControllerTest < ActionController::TestCase
  setup do
    @provider_engaged_user = provider_engaged_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:provider_engaged_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create provider_engaged_user" do
    assert_difference('ProviderEngagedUser.count') do
      post :create, provider_engaged_user: { active_status: @provider_engaged_user.active_status, comment: @provider_engaged_user.comment, del_status: @provider_engaged_user.del_status, entity_id: @provider_engaged_user.entity_id, person_id: @provider_engaged_user.person_id, provider_id: @provider_engaged_user.provider_id, user_id: @provider_engaged_user.user_id }
    end

    assert_redirected_to provider_engaged_user_path(assigns(:provider_engaged_user))
  end

  test "should show provider_engaged_user" do
    get :show, id: @provider_engaged_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @provider_engaged_user
    assert_response :success
  end

  test "should update provider_engaged_user" do
    patch :update, id: @provider_engaged_user, provider_engaged_user: { active_status: @provider_engaged_user.active_status, comment: @provider_engaged_user.comment, del_status: @provider_engaged_user.del_status, entity_id: @provider_engaged_user.entity_id, person_id: @provider_engaged_user.person_id, provider_id: @provider_engaged_user.provider_id, user_id: @provider_engaged_user.user_id }
    assert_redirected_to provider_engaged_user_path(assigns(:provider_engaged_user))
  end

  test "should destroy provider_engaged_user" do
    assert_difference('ProviderEngagedUser.count', -1) do
      delete :destroy, id: @provider_engaged_user
    end

    assert_redirected_to provider_engaged_users_path
  end
end
