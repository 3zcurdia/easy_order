source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'rails', '~> 6.0.3'

gem 'jbuilder', '~> 2.7'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.2'

gem 'devise'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'pundit'
gem 'jwt'
# gem 'omniauth-apple'

gem 'aws-sdk-s3', require: false
gem 'friendly_id'
gem 'geocoder'
gem 'image_processing'
gem 'money-rails'
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
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'rubocop'
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
  gem 'scout_apm'
  gem 'sentry-raven'
end
