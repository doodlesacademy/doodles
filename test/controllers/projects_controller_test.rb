require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get show" do
    project = projects(:superhero)
    get :show, { id: project.id }
    assert_response :success
    assert_equal assigns(:project), project
  end

  test "should post create" do
    assert_difference('Project.count') do
      post :create, {
        project: { title: 'The new project!', description: 'So new!' }
      }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should get update" do
    put :update
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get destroy" do
    delete :destroy
    assert_response :success
  end

end
