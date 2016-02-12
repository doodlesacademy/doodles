class AssetsController < ApplicationController

  def new
    Asset.new
  end

  def create
    Asset.create()
  end

  def show
    @asset = Asset.find(params[:id])
    render json: @asset
  end

end
