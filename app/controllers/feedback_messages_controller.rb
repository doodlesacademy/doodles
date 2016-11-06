class FeedbackMessagesController < ApplicationController
  def create
    FeedbackMailer.feedback_email(
      message: params[:message],
      provided_email: params[:email],
      lesson_id: params[:lesson_id],
      was_clear: params[:was_clear],
      user: current_user
    )

    flash[:notice] = 'Thank you for your feedback!'
    redirect_to :back
  end
end
