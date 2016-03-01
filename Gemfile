source 'https://rubygems.org'

gem 'rails', '4.2.4'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'bower'

gem "autoprefixer-rails"

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'
gem 'bcrypt', '~> 3.1.7'

gem 'unicorn'

# Use Capistrano for deployment
gem 'capistrano-rails', group: :development

gem 'gibbon'

gem 'figaro'

gem 'redcarpet'

group :development, :test do
  gem 'pry-rails'
  gem 'byebug'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :production do
  gem 'paperclip', :git=> 'https://github.com/thoughtbot/paperclip', :ref => '523bd46c768226893f23889079a7aa9c73b57d68'
  gem 'aws-sdk', '>= 2.0'
  gem 'rails_12factor'
end
