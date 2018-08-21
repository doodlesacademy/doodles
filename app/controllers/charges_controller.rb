class ChargesController < ApplicationController
  def create
    @products = Product.where(sku: params[:skus])
    amount = @products.reduce(0) { |acc, prod| acc + prod.price }

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    Stripe::Charge.create(
      customer: customer.id,
      amount: amount,
      description: 'Doodles Academy customer',
      currency: 'usd'
    )

    @payment = Payment.create(
      user_id: current_user&.id,
      stripe_email: params[:stripeEmail],
      stripe_customer_id: customer.id,
      amount: amount,
      products: @products
    )

    session[:skus_in_cart] = []
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to '/store/checkout'
  end
end
