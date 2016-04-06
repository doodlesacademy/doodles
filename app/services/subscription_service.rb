class SubscriptionService
  LIST_ID = ENV['MAILCHIMP_LIST_ID']
  API_KEY = ENV['MAILCHIMP_API_KEY']

  def initialize(subscription_params)
    @subscription_params = subscription_params
    @email_address = subscription_params[:email]
    @subscription_id = subscription_params[:id]
    @api_request = Gibbon::Request.new(api_key: API_KEY)
  end

  def subscribe
    # @todo <alex> Better error-handling/reporting here obvs
    return if @email_address.nil?
    @api_request.lists(LIST_ID).members.create(create_params)
  end

  def update
    # @todo <alex> Better error-handling/reporting here obvs
    return unless should_update?
    @api_request.lists(LIST_ID).members(@subscription_id).update(update_params)
  end


  private
  def create_params
    {
      body: {
        email_address: @email_address,
        status: "subscribed"
      }
    }
  end

  def update_params
    {
      body: {
        email_address: @email_address,
        status: "subscribed",
        merge_fields: {
          FNAME: subscription_params[:first_name],
          LNAME: subscription_params[:last_name]
        }
      }
    }
  end

  def should_update?
    has_name? && @subscription_id.present?
  end

  def has_name?
    @subscription_params[:first_name].present? ||
      @subscription_params[:last_name].present?
  end
end
