class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show]

  def index
    redirect_to_project
  end

  def show
  end

  private

  def set_lesson
    @project_set = ProjectSet.find_by_slug(params[:project_slug])
    redirect_to projects_path unless @project_set.present?
    @project = @project_set.get_project(level: @academy_level)
    redirect_to projects_path unless @project.present?
    @lesson = @project.lessons.find_by_slug(params[:slug])
    redirect_to_project unless @lesson.present?
  end

  def redirect_to_project
    redirect_to project_path(@project.slug)
  end

end
