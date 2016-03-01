require 'test_helper'

class Admin::ProjectSetsControllerTest < ActionController::TestCase
  setup do
    @admin_project_set = admin_project_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_project_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_project_set" do
    assert_difference('Admin::ProjectSet.count') do
      post :create, admin_project_set: {  }
    end

    assert_redirected_to admin_project_set_path(assigns(:admin_project_set))
  end

  test "should show admin_project_set" do
    get :show, id: @admin_project_set
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_project_set
    assert_response :success
  end

  test "should update admin_project_set" do
    patch :update, id: @admin_project_set, admin_project_set: {  }
    assert_redirected_to admin_project_set_path(assigns(:admin_project_set))
  end

  test "should destroy admin_project_set" do
    assert_difference('Admin::ProjectSet.count', -1) do
      delete :destroy, id: @admin_project_set
    end

    assert_redirected_to admin_project_sets_path
  end
end
