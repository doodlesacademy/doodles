class ProjectsController < ApplicationController
  def index
    @projects = ProjectSet.all
  end

  def show
    @project = Project.find(params[:id])
   #if !( params[:id].match /\d/ )
   #  slug = params[:id]
   #  @project = Project.find_by_slug(slug)
   #else
   #  begin
   #    project = Project.select(:slug).find(params[:id])
   #  rescue
   #    return redirect_to action: 'index'
   #  end
   #  slug = project.slug
   #  return redirect_to action: 'show', id: slug
   #end
    if @project.blank?
      redirect_to action: 'index'
    end
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
end
