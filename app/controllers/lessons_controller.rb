class LessonsController < ApplicationController
  before_action :load_project

  def show
    @lesson = @project.lessons.find(params[:id])
  end

  def create
    @lesson = @project.lessons.create(lesson_params)
    redirect_to project_path(@project)
  end

  def update
    @lesson = @project.lessons.find(params[:id])
    if @lesson.update_attributes(lesson_params)
      redirect_to project_lesson_path(@project, @lesson)
    else
      render :edit, lesson: @lesson
    end
  end

  def edit
    @lesson = @project.lessons.find(params[:id])
  end

  def new
    @lesson = @project.lessons.new
  end

  def destroy
    @lesson = @project.lessons.find(params[:id])
    @lesson.destroy unless @lesson.nil?
    redirect_to project_path(@project)
  end

  private
  def load_project
    @project = Project.find(params[:project_id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :video_uri, :description)
  end
end
