class SubscriptionsController < ApplicationController
  def create
    # @todo <alex> make this an async job
    #SubscriptionService.new(subscription_params).subscribe
    render nothing: true
  end

  private
  def subscription_params
    params.require(:subscription).permit(:email)
  end
end
