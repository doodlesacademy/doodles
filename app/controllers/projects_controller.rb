class ProjectsController < ApplicationController
  before_action :find_project_set_and_project, only: [:show]

  def index
    @projects = ProjectSet.published.all
  end

  def edit
  end

  def show
  end

  private
    def find_project_set_and_project
      @project_set = ProjectSet.published.find_by_slug(params[:slug])
      redirect_to action: 'index' unless @project_set.present?
      @project = @project_set.get_project(level: @academy)
      redirect_to action: 'index' unless @project.present?
    end
end
