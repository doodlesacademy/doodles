class ProjectsController < ApplicationController
  def index
    @projects = ProjectSet.all
  end

  def show
    # @project = Project.find(params[:id])
    project_set = ProjectSet.find_by_slug(params[:slug])
    redirect_to action: 'index' unless project_set.present?
    level = params[:level] || session[:level] || "lower"
    level = "lower" unless valid_level?(level: session[:level]) 
    session[:level] = level
    @project = level == "upper" ? project_set.upper : project_set.lower
  end

  def create
    @project = Project.create(project_params)
    redirect_to action: 'show', id: @project.id
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to action: 'show', id: @project.id
    else
      render :edit, project: @project
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy unless @project.nil?
    redirect_to action: 'index'
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :level)
  end

  def valid_level? (level:)
    level.present? && Project.levels.include?(level)
  end
end
