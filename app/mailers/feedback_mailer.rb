class FeedbackMailer < ActionMailer::Base
  FEEDBACK_ADDRESS = "info@doodlesacademy.org"

  attr_reader :email, :user

  def feedback_email(message:, provided_email: nil, user: nil)
    @provided_email = provided_email
    @user = user

    @email_address = email_address
    @user_name = user_name
    @message = message

    mail(to: FEEDBACK_ADDRESS, subject: 'Website feedback')
  end


  private

  def email_address
    user.nil? ? email : user.email
  end

  def user_name
    user.nil? ? 'Anonymous' : user.full_name
  end
end
