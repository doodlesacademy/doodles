class SubscriptionsController < ApplicationController
  def create
    # @todo <alex> make this an async job
    @subscription = SubscriptionService.new(subscription_params).subscribe
    redirect_to action: 'thanks', update: false, id: @subscription["id"]
  end

  def update
    SubscriptionService.new(subscription_params).update
    redirect_to action: 'thanks', update: true
  end

  def thanks
  end

  private
  def subscription_params
    params.require(:subscription).permit(:email, :first_name, :last_name, :id)
  end
end
