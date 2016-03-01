class Admin::ProjectSetsController < ApplicationController
  before_action :set_admin_project_set, only: [:show, :edit, :update, :destroy]
  layout "admin"

  # GET /admin/project_sets
  def index
    @project_sets = ProjectSet.all
  end

  # GET /admin/project_sets/1
  def show
  end

  # GET /admin/project_sets/new
  def new
    @project_set = ProjectSet.new
  end

  # GET /admin/project_sets/1/edit
  def edit
  end

  # POST /admin/project_sets
  def create
    @project_set = ProjectSet.new(admin_project_set_params)
    if @project_set.save
      redirect_to @project_set, notice: 'Project set was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/project_sets/1
  def update
    if @project_set.update(admin_project_set_params)
      redirect_to @project_set, notice: 'Project set was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/project_sets/1
  def destroy
    @project_set.destroy
    redirect_to admin_project_sets_url, notice: 'Project set was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_project_set
      @project_set = ProjectSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_project_set_params
      params.require(:admin_project_set).permit(:title, :project_image)
    end
end
