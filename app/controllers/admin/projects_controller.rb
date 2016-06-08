class Admin::ProjectsController < ApplicationController
  before_action :authenticate_user!, :admin_only!
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  layout "admin"

  # GET /admin/projects
  def index
    @projects = Project.all
  end

  # GET /admin/projects/1
  def show
  end

  # GET /admin/projects/new
  def new
    @project_set = ProjectSet.new
  end

  # GET /admin/projects/1/edit
  def edit
  end

  # POST /admin/projects
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to admin_project_url @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/projects/1
  def update
    if @project.update(project_params)
      redirect_to admin_project_url @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:overview, :synopsis, :materials, :materials_suggestion, :books_media, :common_core, :national_core, :art_elements, :art_principles, :cross_curricular, :inspiration_image, :featured_artist_image, :featured_artist_description, sections_attributes: [:id, :order, :content])
    end
end
