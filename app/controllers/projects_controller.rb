class ProjectsController < ApplicationController
  def index
    @projects = ProjectSet.all
  end

  def show
    @project = Project.find(params[:id])
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
    params.require(:project).permit(:title, :description)
  end
end
