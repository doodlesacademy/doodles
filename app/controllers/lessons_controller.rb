class LessonsController < ApplicationController
  before_action :set_lesson
  before_action :finished_verb, only: [:show]

  def index
    redirect_to_project
  end

  def show
  end

  private

  def set_lesson
    @project_set = ProjectSet.find_by_slug(params[:project_slug])
    redirect_to projects_path unless @project_set.present?
    @project = @project_set.get_project(level: @academy)
    redirect_to projects_path unless @project.present?
    @lesson = @project.lessons.find_by_slug(params[:slug])
    redirect_to_project unless @lesson.present?
  end

  def redirect_to_project
    redirect_to project_path(@project.slug)
  end

  def finished_verb
    verbs = %w(hooray congratulations great\ job amazing you\ rock wow excellent)
    @finished_verb = verbs.sample
  end

end
