require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  test 'associations' do
    payment = Payment.first
    assert_equal 1, payment.products.count

    assert_not_nil payment.user

    user = payment.user
    assert_equal 1, user.payments.count
  end
end
