# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 5.6'
gem 'rails', '~> 6.1.5'

gem 'cssbundling-rails'
gem 'hotwire-rails'
gem 'importmap-rails'

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
gem 'jbuilder', '~> 2.11'
gem 'kaminari'
gem 'money-rails'
gem 'paranoia', '~> 2.5'
gem 'redis'
gem 'rqrcode'
gem 'sidekiq'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'debug', '>= 1.0.0', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
end

group :development do
  gem 'letter_opener'
  gem 'listen', '~> 3.7'
  gem 'rack-mini-profiler', '~> 3.0'
  gem 'rubocop', require: false
  gem 'rubocop-minitest', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'shoulda', '>= 4.0'
  gem 'shoulda-matchers', '>= 4.0'
  gem 'webdrivers'
end

group :production do
  gem 'dalli'
  gem 'sentry-ruby'
end
