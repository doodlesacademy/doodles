class StandardsController < ApplicationController
  before_action :set_standard

  def edit
  end

  def update
    if @standard.update_attributes(standard_params)
      redirect_to project_path @project.slug
    else
      render :edit
    end
  end

  private
    def standard_params
      params.require(:standard).permit(:document, sections_attributes: [:id, :order, :content])
    end

    def set_standard
      @project_set = ProjectSet.find_by_slug(params[:project_slug])
      redirect_to action: 'index' unless @project_set.present?
      @project = @project_set.get_project(level: @academy_level)
      redirect_to action: 'index' unless @project.present?
      @standard = @project.standard
    end

end
