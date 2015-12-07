require 'test_helper'

class FeedbackMessagesControllerTest < ActionController::TestCase
  test "should create new message" do
    lesson = lessons(:superhero_lesson_1)
    valid_params = {
      feedback_message: {
        body: 'This is a great piece of feedback! Much usefulness!',
        sender: 'bloop@doop.edu',
        lesson_id: lesson.id
      }
    }

    assert_difference('FeedbackMessage.count') do
      post :create, valid_params
    end

    assert_response :success
  end
end
