class FeedbackMailer < ActionMailer::Base
  # FEEDBACK_ADDRESS = "info@doodles-academy.org"
  FEEDBACK_ADDRESS = "athunley@gmail.com"

  attr_reader :user

  def feedback_email(message: nil, user: nil, lesson_id: nil, was_clear: true)
    @user = user

    @email_address = email_address
    @user_name = user_name
    @message = message
    @lesson = Lesson.find(lesson_id) unless lesson_id.nil?
    @was_clear = was_clear

    mail(to: FEEDBACK_ADDRESS, subject: 'Website feedback')
  end


  private

  def email_address
    user.nil? ? 'no email' : user.email
  end

  def user_name
    user.nil? ? 'Anonymous' : user.full_name
  end
end
