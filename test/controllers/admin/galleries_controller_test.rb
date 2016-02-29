require 'test_helper'

class Admin::GalleriesControllerTest < ActionController::TestCase
  setup do
    @admin_gallery = admin_galleries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_galleries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_gallery" do
    assert_difference('Admin::Gallery.count') do
      post :create, admin_gallery: {  }
    end

    assert_redirected_to admin_gallery_path(assigns(:admin_gallery))
  end

  test "should show admin_gallery" do
    get :show, id: @admin_gallery
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_gallery
    assert_response :success
  end

  test "should update admin_gallery" do
    patch :update, id: @admin_gallery, admin_gallery: {  }
    assert_redirected_to admin_gallery_path(assigns(:admin_gallery))
  end

  test "should destroy admin_gallery" do
    assert_difference('Admin::Gallery.count', -1) do
      delete :destroy, id: @admin_gallery
    end

    assert_redirected_to admin_galleries_path
  end
end
