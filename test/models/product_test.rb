require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'associations' do
    product = Product.first
    assert_equal 1, product.payments.count
  end

  test 'find_for_user()' do
    user = User.first
    products = Product.find_for_user(user)

    assert_equal 1, products.count
  end
end
