class Admin::GalleriesController < ApplicationController
  before_action :authenticate_user!, :admin_only!
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]
  layout "admin"

  # GET /admin/galleries
  def index
    @galleries = Gallery.all
  end

  # GET /admin/galleries/1
  def show
  end

  # GET /admin/galleries/new
  def new
    @gallery = Gallery.new
  end

  # GET /admin/galleries/1/edit
  def edit
  end

  # POST /admin/galleries
  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      redirect_to action: :index, notice: 'Gallery was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/galleries/1
  # PATCH/PUT /admin/galleries/1.json
  def update
    if @gallery.update(gallery_params)
      redirect_to action: :index, notice: 'Gallery was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/galleries/1
  # DELETE /admin/galleries/1.json
  def destroy
    @gallery.destroy
    redirect_to action: :index, notice: 'Gallery was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_params
      params.fetch(:gallery, {})
    end
end
