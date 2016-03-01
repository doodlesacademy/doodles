class Admin::SupplyItemsController < ApplicationController
  before_action :set_supply_item, only: [:show, :edit, :update, :destroy]
  layout "admin"

  # GET /admin/supply_items
  def index
    @supply_items = SupplyItem.all
  end

  # GET /admin/supply_items/1
  def show
  end

  # GET /admin/supply_items/new
  def new
    @supply_item = SupplyItem.new
  end

  # GET /admin/supply_items/1/edit
  def edit
  end

  # POST /admin/supply_items
  def create
    @supply_item = SupplyItem.new(supply_item_params)
    if @supply_item.save
       redirect_to admin_supply_item_url @supply_item, notice: 'Supply item was successfully created.'
    else
       render :new
    end
  end

  # PATCH/PUT /admin/supply_items/1
  def update
    if @supply_item.update(admin_supply_item_params)
       redirect_to admin_supply_item_url @supply_item, notice: 'Supply item was successfully updated.'
    else
       render :edit
    end
  end

  # DELETE /admin/supply_items/1
  def destroy
    @supply_item.destroy
     redirect_to admin_supply_items_url, notice: 'Supply item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supply_item
      @supply_item = SupplyItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supply_item_params
      params.fetch(:supply_item, {})
    end
end
