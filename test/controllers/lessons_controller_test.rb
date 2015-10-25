require 'test_helper'

class LessonsControllerTest < ActionController::TestCase
  test "should get simple show" do
    project = projects(:superhero)
    lesson = lessons(:superhero_lesson_1)

    get :show, {
      project_id: project.id,
      id: lesson.id
    }

    assert_not_nil assigns(:lesson)
    assert_not_nil assigns(:project)
    assert_equal assigns(:lesson), lesson
    assert_equal assigns(:project), project
    assert_response :success
  end

  test "should post simple create" do
    project = projects(:superhero)

    valid_params = {
      title: 'That new lesson!',
      description: 'What a great lesson!',
    }

    assert_difference('Lesson.count') do
      post :create, { project_id: project.id, lesson: valid_params }
    end

    assert_redirected_to project_path(project)
  end

  test "should increment project's cached counter" do
    project = projects(:superhero)

    valid_params = {
      title: 'This is an even newer lesson!',
      description: 'Shlamp'
    }

    assert_difference(project.lessons_count) do
      post :create, { project_id: project.id, lesson: valid_params }
    end
  end

  test "should put simple update" do
    project = projects(:superhero)
    lesson = project.lessons.first
    new_title = "That new hot hot"

    put :update, {
      project_id: project.id,
      id: lesson.id,
      lesson: { title: new_title }
    }
    lesson.reload

    assert_equal lesson.title, new_title
    assert_redirected_to project_lesson_path(
      assigns(:project), assigns(:lesson)
    )
  end

  test "should get edit" do
    project = projects(:superhero)
    lesson = project.lessons.first

    get :edit, { project_id: project.id, id: lesson.id }

    assert_not_nil assigns(:lesson)
    assert_equal lesson, assigns(:lesson)
    assert_response :success
  end

  test "should get new" do
    project = projects(:superhero)
    get :new, { project_id: project.id }

    assert_not_nil assigns(:lesson)
    assert_not assigns(:lesson).persisted?
    assert_response :success
  end

  test "should get destroy" do
    project = projects(:superhero)
    lesson = project.lessons.first

    assert_difference('Lesson.count', -1) do
      delete :destroy, { project_id: project.id, id: lesson.id }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "destroying lesson should decrease counter cache on project" do
    project = projects(:superhero)
    lesson = project.lessons.first

    assert_difference(project.lessons_count, -1) do
      delete :destroy, { project_id: project.id, id: lesson.id }
    end
  end
end
