require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  @@valid_params = {
    title: 'New Project',
    description: 'Just so new!',
    level: 'upper'
  }

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get show" do
    project = projects(:superhero_upper)
    get :show, { id: project.id }
    assert_response :success
    assert_equal assigns(:project), project
  end

  test "should post create" do
    assert_difference('Project.count') do
      post :create, {
        project: @@valid_params
      }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should put update" do
    project = projects(:superhero_upper)
    new_title = "Not the old title"
    put :update, {
      id: project.id,
      project: { title: new_title }
    }
    project.reload

    assert_equal project.title, new_title
    assert_redirected_to project_path(assigns(:project))
  end

  test "should get edit" do
    project = projects(:superhero_upper)
    get :edit, id: project.id

    assert_not_nil assigns(:project)
    assert_equal assigns(:project), project
    assert_response :success
  end

  test "should get new" do
    get :new

    assert_not_nil assigns(:project)
    assert_not assigns(:project).persisted?
    assert_response :success
  end

  test "should delete destroy" do
    project = projects(:painting_upper)
    assert_difference('Project.count', -1) do
      delete :destroy, id: project.id
    end

    assert_redirected_to projects_path
  end

end
