class FeedbackMessagesController < ApplicationController
  def create
    FeedbackMailer.feedback_email(
      message: params[:message],
      user: current_user,
      lesson_id: params[:lesson_id],
      was_clear: params[:was_lesson_clear],
    ).deliver_now

    flash[:notice] = 'Thank you for your feedback!'
    redirect_to :back
  end
end
