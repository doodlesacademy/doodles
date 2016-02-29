class Admin::StandardsController < ApplicationController
  before_action :set_standard, only: [:show, :edit, :update, :destroy]
  layout "admin"

  # GET /admin/standards
  # GET /admin/standards.json
  def index
    @standards = Standard.all
  end

  # GET /admin/standards/1
  # GET /admin/standards/1.json
  def show
  end

  # GET /admin/standards/new
  def new
    @standard = Standard.new
  end

  # GET /admin/standards/1/edit
  def edit
  end

  # POST /admin/standards
  # POST /admin/standards.json
  def create
    @standard = Standard.new(standard_params)

    respond_to do |format|
      if @standard.save
        format.html { redirect_to @standard, notice: 'Standard was successfully created.' }
        format.json { render :show, status: :created, location: @standard }
      else
        format.html { render :new }
        format.json { render json: @standard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/standards/1
  # PATCH/PUT /admin/standards/1.json
  def update
    respond_to do |format|
      if @standard.update(standard_params)
        format.html { redirect_to @standard, notice: 'Standard was successfully updated.' }
        format.json { render :show, status: :ok, location: @standard }
      else
        format.html { render :edit }
        format.json { render json: @standard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/standards/1
  # DELETE /admin/standards/1.json
  def destroy
    @standard.destroy
    respond_to do |format|
      format.html { redirect_to standards_url, notice: 'Standard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standard
      @standard = Standard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def standard_params
      params.fetch(:standard, {})
    end
end
