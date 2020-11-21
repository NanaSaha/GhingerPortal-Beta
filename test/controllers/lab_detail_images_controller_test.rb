require 'test_helper'

class LabDetailImagesControllerTest < ActionController::TestCase
  setup do
    @lab_detail_image = lab_detail_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lab_detail_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lab_detail_image" do
    assert_difference('LabDetailImage.count') do
      post :create, lab_detail_image: { active_status: @lab_detail_image.active_status, comment: @lab_detail_image.comment, del_status: @lab_detail_image.del_status, lab_detail_id: @lab_detail_image.lab_detail_id, pre_appointment_id: @lab_detail_image.pre_appointment_id, user_id: @lab_detail_image.user_id }
    end

    assert_redirected_to lab_detail_image_path(assigns(:lab_detail_image))
  end

  test "should show lab_detail_image" do
    get :show, id: @lab_detail_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lab_detail_image
    assert_response :success
  end

  test "should update lab_detail_image" do
    patch :update, id: @lab_detail_image, lab_detail_image: { active_status: @lab_detail_image.active_status, comment: @lab_detail_image.comment, del_status: @lab_detail_image.del_status, lab_detail_id: @lab_detail_image.lab_detail_id, pre_appointment_id: @lab_detail_image.pre_appointment_id, user_id: @lab_detail_image.user_id }
    assert_redirected_to lab_detail_image_path(assigns(:lab_detail_image))
  end

  test "should destroy lab_detail_image" do
    assert_difference('LabDetailImage.count', -1) do
      delete :destroy, id: @lab_detail_image
    end

    assert_redirected_to lab_detail_images_path
  end
end
