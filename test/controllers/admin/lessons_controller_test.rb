require 'test_helper'

class Admin::LessonsControllerTest < ActionController::TestCase
  setup do
    @admin_lesson = admin_lessons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_lessons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_lesson" do
    assert_difference('Admin::Lesson.count') do
      post :create, admin_lesson: {  }
    end

    assert_redirected_to admin_lesson_path(assigns(:admin_lesson))
  end

  test "should show admin_lesson" do
    get :show, id: @admin_lesson
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_lesson
    assert_response :success
  end

  test "should update admin_lesson" do
    patch :update, id: @admin_lesson, admin_lesson: {  }
    assert_redirected_to admin_lesson_path(assigns(:admin_lesson))
  end

  test "should destroy admin_lesson" do
    assert_difference('Admin::Lesson.count', -1) do
      delete :destroy, id: @admin_lesson
    end

    assert_redirected_to admin_lessons_path
  end
end
