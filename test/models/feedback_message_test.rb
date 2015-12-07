require 'test_helper'

class FeedbackMessageTest < ActiveSupport::TestCase
  @@valid_params = {
    sender: 'blah@dah.org',
    body: 'This is a really great lesson. Thanks!'
  }

  test "it should not be valid without a sender" do
    params = @@valid_params.keep_if { |k, _v| k != :sender }
    message = FeedbackMessage.new(params)
    assert_not message.valid?
  end

  test "it should not be valid without a body" do
    params = @@valid_params.keep_if { |k, _v| k != :body }
    message = FeedbackMessage.new(params)
    assert_not message.valid?
  end
end
