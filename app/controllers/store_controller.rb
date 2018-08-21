class StoreController < ApplicationController
  before_action :store_user_location!, only: :checkout, if: :storable_location?

  def index
    @products = Product.all
  end

  def checkout
    sku = params[:sku]
    delete_sku = params[:delete]

    product = Product.find_by(sku: sku)
    add_sku_to_cart(sku) unless product.nil?
    remove_sky_from_cart(delete_sku) unless delete_sku.nil?

    @products = products_in_cart
    @total_price = @products.reduce(0) { |acc, prod| acc + prod.price }
    @formatted_price = Product.format_price(@total_price)
  end

  def product
    @product = Product.find_by(sku: params[:sku])
  end

  def landing
  end

  private

  def add_sku_to_cart(sku)
    session[:skus_in_cart] = [] if session[:skus_in_cart].nil?
    session[:skus_in_cart] << sku
    session[:skus_in_cart].uniq!
  end

  def remove_sky_from_cart(sku)
    session[:skus_in_cart].delete_if { |x| x == sku }
  end

  def products_in_cart
    Product.where(sku: session[:skus_in_cart])
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end
end
