class Admin::LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:create, :update]
  layout "admin"

  # GET /admin/lessons
  def index
    @lessons = Lesson.all
    @lesson_projects = @lessons.group_by(&:project_id)
  end

  # GET /admin/lessons/1
  def show
  end

  # GET /admin/lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /admin/lessons/1/edit
  def edit
  end

  # POST /admin/lessons
  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to :index, notice: 'Lesson was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/lessons/1
  def update
    if @lesson.update(lesson_params)
      redirect_to :index, notice: 'Lesson was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/lessons/1
  def destroy
    @lesson.destroy
    redirect_to :index, notice: 'Lesson was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    def set_project
      @project_set = ProjectSet.find_by_slug params[:project_slug]
      @project = @project_set.get_project level: params[:project_level].to_sym
      params[:lesson][:project_id] = @project.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:title, :video_uri, sections_attributes: [:id, :order, :content])
    end
end
