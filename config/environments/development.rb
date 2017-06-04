Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'doodles-academy.org',
    user_name:            ENV['GMAIL_USER'],
    password:             ENV['GMAIL_PASSWORD'],
    authentication:       :plain,
    enable_starttls_auto: true
  }
  config.action_mailer.default_url_options = {
    :host => "doodles-academy.org"
  }
  config.action_mailer.default_options = {
    from: "noreply@doodles-academy.org"
  }
  config.action_mailer.perform_deliveries = true
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.digest = true
  config.assets.raise_runtime_errors = true

  if ENV['SHOW_S3_ASSETS'].present?
    config.paperclip_defaults = {
      :storage => :s3,
      :s3_credentials => {
        :bucket => ENV['S3_BUCKET_NAME'],
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
      },
      :s3_region => ENV['S3_REGION'],
      :s3_host_name => ENV['S3_HOST_NAME']
    }
  end
end
