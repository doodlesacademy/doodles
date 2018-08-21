require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  test 'associations' do
    payment = Payment.first
    assert_equal 1, payment.products.count
  end
end
