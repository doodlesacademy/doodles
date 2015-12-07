class FeedbackMessagesController < ApplicationController
  def create
    @feedback = FeedbackMessage.create(feedback_params)
    render nothing: true
  end

  private
  def feedback_params
    params.require(:feedback_message).permit(:sender, :body)
  end
end
