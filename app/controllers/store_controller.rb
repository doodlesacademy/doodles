class StoreController < ApplicationController
  def index
    @products = Product.all
  end

  def checkout
    @product = Product.find_by(sku: params[:sku])
  end
end
