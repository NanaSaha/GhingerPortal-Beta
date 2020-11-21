require 'test_helper'

class DeclineCommentsControllerTest < ActionController::TestCase
  setup do
    @decline_comment = decline_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:decline_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create decline_comment" do
    assert_difference('DeclineComment.count') do
      post :create, decline_comment: { active_status: @decline_comment.active_status, available_date: @decline_comment.available_date, comment: @decline_comment.comment, del_status: @decline_comment.del_status, pre_confirmed_appointment_id: @decline_comment.pre_confirmed_appointment_id }
    end

    assert_redirected_to decline_comment_path(assigns(:decline_comment))
  end

  test "should show decline_comment" do
    get :show, id: @decline_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @decline_comment
    assert_response :success
  end

  test "should update decline_comment" do
    patch :update, id: @decline_comment, decline_comment: { active_status: @decline_comment.active_status, available_date: @decline_comment.available_date, comment: @decline_comment.comment, del_status: @decline_comment.del_status, pre_confirmed_appointment_id: @decline_comment.pre_confirmed_appointment_id }
    assert_redirected_to decline_comment_path(assigns(:decline_comment))
  end

  test "should destroy decline_comment" do
    assert_difference('DeclineComment.count', -1) do
      delete :destroy, id: @decline_comment
    end

    assert_redirected_to decline_comments_path
  end
end
