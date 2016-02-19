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
    @project_set = ProjectSet.create(project_params)
    redirect_to action: 'show', id: @project.id
  end

  def update
    @project_set = ProjectSet.find_by_slug(params[:slug])
    if @project_set.update_attributes(project_set_params)
      redirect_to action: 'show', slug: @project_set.slug
    else
      render :edit, project_set: @project_set 
    end
  end

  def edit
    @project_set = ProjectSet.find_by_slug(params[:slug])
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
  def project_set_params
    params.require(:project_set).permit(:title, :synopsis, :photocopies, :skills)
  end
  def project_params
    params.require(:project).permit(:title, :description, :level)
  end

  def valid_level? (level:)
    level.present? && Project.levels.include?(level)
  end
end
