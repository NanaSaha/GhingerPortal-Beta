require 'test_helper'

class PersonInfoExtrasControllerTest < ActionController::TestCase
  setup do
    @person_info_extra = person_info_extras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:person_info_extras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person_info_extra" do
    assert_difference('PersonInfoExtra.count') do
      post :create, person_info_extra: { active_status: @person_info_extra.active_status, comment: @person_info_extra.comment, del_status: @person_info_extra.del_status, entity_id: @person_info_extra.entity_id, foreign_institution_desc: @person_info_extra.foreign_institution_desc, forign_training: @person_info_extra.forign_training, has_specialty: @person_info_extra.has_specialty, licence_number: @person_info_extra.licence_number, person_id: @person_info_extra.person_id, profession_group_id: @person_info_extra.profession_group_id, specialty_duration: @person_info_extra.specialty_duration, specialty_id: @person_info_extra.specialty_id, user_id: @person_info_extra.user_id }
    end

    assert_redirected_to person_info_extra_path(assigns(:person_info_extra))
  end

  test "should show person_info_extra" do
    get :show, id: @person_info_extra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person_info_extra
    assert_response :success
  end

  test "should update person_info_extra" do
    patch :update, id: @person_info_extra, person_info_extra: { active_status: @person_info_extra.active_status, comment: @person_info_extra.comment, del_status: @person_info_extra.del_status, entity_id: @person_info_extra.entity_id, foreign_institution_desc: @person_info_extra.foreign_institution_desc, forign_training: @person_info_extra.forign_training, has_specialty: @person_info_extra.has_specialty, licence_number: @person_info_extra.licence_number, person_id: @person_info_extra.person_id, profession_group_id: @person_info_extra.profession_group_id, specialty_duration: @person_info_extra.specialty_duration, specialty_id: @person_info_extra.specialty_id, user_id: @person_info_extra.user_id }
    assert_redirected_to person_info_extra_path(assigns(:person_info_extra))
  end

  test "should destroy person_info_extra" do
    assert_difference('PersonInfoExtra.count', -1) do
      delete :destroy, id: @person_info_extra
    end

    assert_redirected_to person_info_extras_path
  end
end
