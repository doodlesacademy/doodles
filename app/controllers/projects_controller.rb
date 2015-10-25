class ProjectsController < ApplicationController
  def index
    @projects = Project.all
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
      redirect_to action: 'index'
    else
      render :show, project: @project
    end
  end

  def edit
  end

  def new
  end

  def destroy
  end

  private
  def project_params
    params.require(:project).permit(:title, :description)
  end
end
