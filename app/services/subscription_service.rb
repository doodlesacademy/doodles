class SubscriptionService
  def initialize(options)
    @subscription_params = options[:subscription]
    @email_address = @subscription_params[:email]
    @api_request = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
  end

  def subscribe
    # @todo <alex> Better error-handling here obvs
    return if @email_address.nil?
    @api_request.lists(ENV['MAILCHIMP_LIST_ID']).create(create_params)
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
end
