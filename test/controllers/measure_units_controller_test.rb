require 'test_helper'

class MeasureUnitsControllerTest < ActionController::TestCase
  setup do
    @measure_unit = measure_units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:measure_units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create measure_unit" do
    assert_difference('MeasureUnit.count') do
      post :create, measure_unit: { active_status: @measure_unit.active_status, comment: @measure_unit.comment, del_status: @measure_unit.del_status, unit_alias: @measure_unit.unit_alias, unit_desc: @measure_unit.unit_desc, user_id: @measure_unit.user_id }
    end

    assert_redirected_to measure_unit_path(assigns(:measure_unit))
  end

  test "should show measure_unit" do
    get :show, id: @measure_unit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @measure_unit
    assert_response :success
  end

  test "should update measure_unit" do
    patch :update, id: @measure_unit, measure_unit: { active_status: @measure_unit.active_status, comment: @measure_unit.comment, del_status: @measure_unit.del_status, unit_alias: @measure_unit.unit_alias, unit_desc: @measure_unit.unit_desc, user_id: @measure_unit.user_id }
    assert_redirected_to measure_unit_path(assigns(:measure_unit))
  end

  test "should destroy measure_unit" do
    assert_difference('MeasureUnit.count', -1) do
      delete :destroy, id: @measure_unit
    end

    assert_redirected_to measure_units_path
  end
end
