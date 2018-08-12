class StoreController < ApplicationController
  def index
    @products = Product.all
  end

  def checkout
  end
end
