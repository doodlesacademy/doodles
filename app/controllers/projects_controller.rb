class ProjectsController < ApplicationController
  before_action :find_project_set_and_project, only: [:show]

  def index
    @units = Unit.all.includes(:project_sets)
  end

  def edit
  end

  def show
  end

  def favorite
    @project = Project.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @project
      redirect_to :back, notice: 'You favorited #{@project}'

    elsif type == "unfavorite"
      current_user.favorites.delete(@project)
      redirect_to :back, notice: 'Unfavorited #{@project}'

    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end

  private
    def find_project_set_and_project
      @project_set = ProjectSet.published.find_by_slug(params[:slug])
      redirect_to action: 'index' unless @project_set.present?
      @project = @project_set.get_project(level: @academy)
      redirect_to action: 'index' unless @project.present?
    end
end
