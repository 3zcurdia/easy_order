# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 5.3'
gem 'rails', '~> 6.1.3'

gem 'jbuilder', '~> 2.11'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.4'

gem 'devise'
gem 'jwt'
# gem 'omniauth-apple'
# gem 'omniauth-facebook'
# gem 'omniauth-google-oauth2'
gem 'pundit'

gem 'aws-sdk-s3', require: false
gem 'friendly_id'
gem 'geocoder'
gem 'image_processing'
gem 'kaminari'
gem 'money-rails'
gem 'paranoia', '~> 2.2'
gem 'redis'
gem 'rqrcode'
gem 'sidekiq'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'letter_opener'
  gem 'listen', '~> 3.5'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'rubocop', require: false
  gem 'rubocop-minitest', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'shoulda'
  gem 'shoulda-matchers'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

group :production do
  gem 'dalli'
  gem 'sentry-raven'
end
