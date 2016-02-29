require 'test_helper'

class Admin::StandardsControllerTest < ActionController::TestCase
  setup do
    @admin_standard = admin_standards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_standards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_standard" do
    assert_difference('Admin::Standard.count') do
      post :create, admin_standard: {  }
    end

    assert_redirected_to admin_standard_path(assigns(:admin_standard))
  end

  test "should show admin_standard" do
    get :show, id: @admin_standard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_standard
    assert_response :success
  end

  test "should update admin_standard" do
    patch :update, id: @admin_standard, admin_standard: {  }
    assert_redirected_to admin_standard_path(assigns(:admin_standard))
  end

  test "should destroy admin_standard" do
    assert_difference('Admin::Standard.count', -1) do
      delete :destroy, id: @admin_standard
    end

    assert_redirected_to admin_standards_path
  end
end
