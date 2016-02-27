class LessonsController < ApplicationController
  before_action :find_project_set_and_project

  def index
    redirect_to_project
  end

  def show
    find_lesson
  end

  def create
    @lesson = @project.lessons.create(lesson_params)
    redirect_to_project
  end

  def update
    find_lesson
    if @lesson.update_attributes(lesson_params)
      redirect_to project_lesson_path(@project.slug, @lesson.slug)
    else
      render :edit, lesson: @lesson
    end
  end

  def edit
    find_lesson
  end

  def new
    @lesson = @project.lessons.new
  end

  def destroy
    find_lesson
    @lesson.destroy unless @lesson.nil?
    redirect_to_project
  end

  private
  def lesson_params
    params.require(:lesson).permit(:title, :video_uri, :synopsis, :setup, :photocopies, :media)
  end

  def find_project_set_and_project
    @project_set = ProjectSet.find_by_slug(params[:project_slug])
    redirect_to projects_path unless @project_set.present?
    @project = @project_set.get_project(level: @academy_level)
    redirect_to projects_path unless @project.present?
  end

  def find_lesson
    @lesson = @project.lessons.find_by_slug(params[:slug])
    redirect_to_project unless @lesson.present?
  end

  def redirect_to_project
    redirect_to project_path(@project.slug)
  end
end
