require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'associations' do
    product = Product.first
    assert_equal 1, product.payments.count
  end
end
