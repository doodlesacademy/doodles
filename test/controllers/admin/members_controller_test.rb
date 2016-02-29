require 'test_helper'

class Admin::MembersControllerTest < ActionController::TestCase
  setup do
    @member = admin_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member" do
    assert_difference('Admin::Member.count') do
      post :create, member: {  }
    end

    assert_redirected_to member_path(assigns(:admin_member))
  end

  test "should show member" do
    get :show, id: @member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member
    assert_response :success
  end

  test "should update member" do
    patch :update, id: @member, admin_member: {  }
    assert_redirected_to member_path(assigns(:admin_member))
  end

  test "should destroy member" do
    assert_difference('Admin::Member.count', -1) do
      delete :destroy, id: @member
    end

    assert_redirected_to members_path
  end
end
