class ProjectsController < ApplicationController
  def index
    @projects = ProjectSet.all
  end

  def show
    find_project_set_and_project
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
    find_project_set_and_project
  end

  def new
    @project_set = ProjectSet.new
  end

  def destroy
    find_project_set_and_project
    @project_set.destroy unless @project_set.nil?
    redirect_to action: 'index'
  end

  private

  def project_set_params
    params.require(:project_set).permit(:title, :unit_number, :unit, :project, projects_attributes: [:id, :inspiration_image, :synopsis, :skills, :books_media, :photocopies])
  end

  def project_params
    params.require(:project).permit(:synopsis, :skills, :books_media, :photocopies)
  end

  def find_project_set_and_project
    @project_set = ProjectSet.find_by_slug(params[:slug])
    redirect_to action: 'index' unless @project_set.present?
    @project = @project_set.get_project(level: @academy_level)
    redirect_to action: 'index' unless @project.present?
  end

end
