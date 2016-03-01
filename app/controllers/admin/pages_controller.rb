class Admin::PagesController < ApplicationController
  before_action :authenticate_user!, :admin_only!
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  layout "admin"

  # GET /admin/pages
  def index
    @pages = Page.unscoped.all
  end

  # GET /admin/pages/1
  def show
    if @page.draft?
      @level = "warning"
      @status_notice = "This page is a draft. It will become acessible once it is published."
    elsif @page.archive?
      @level = "warning"
      @status_notice = "This page has been archived."
    end
  end

  # GET /admin/pages/new
  def new
    @page = Page.new
  end

  # GET /admin/pages/1/edit
  def edit
  end

  # POST /admin/pages
  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to admin_page_url @page, notice: 'Page was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/pages/1
  def update
    if @page.update(page_params)
      redirect_to admin_page_url @page, notice: 'Page was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/pages/1
  def destroy
    @page.destroy
    redirect_to admin_pages_url, notice: 'Page was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.unscoped.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :status, :content, :hero_content, :hero_image)
    end
end
