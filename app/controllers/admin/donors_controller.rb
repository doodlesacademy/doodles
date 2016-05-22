class Admin::DonorsController < ApplicationController
  before_action :authenticate_user!, :admin_only!
  before_action :set_donor, only: [:show, :edit, :update, :destroy]
  layout "admin"

  # GET /admin/donors
  def index
    @donors = Donor.all
  end

  # GET /admin/donors/1
  def show
  end

  # GET /admin/donors/new
  def new
    @donor = Donor.new
  end

  # GET /admin/donors/1/edit
  def edit
  end

  # POST /admin/donors
  def create
    @donor = Donor.new(donor_params)
    if @donor.save
      redirect_to action: :index
      flash[:notice] = 'donor was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/donors/1
  def update
    if @donor.update(donor_params)
      redirect_to admin_donor_path(@donor), notice: 'donor was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/donors/1
  def destroy
    if @donor.destroy
      redirect_to action: :index
      flash[:notice] = 'donor was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donor
      @donor = Donor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donor_params
      params.require(:donor).permit(:first_name, :last_name)
    end
end
