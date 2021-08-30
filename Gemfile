# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 5.4'
gem 'rails', '~> 6.1.4'

gem 'jbuilder', '~> 2.11'
gem 'turbo-rails'
# gem "sass-rails", ">= 6" # TODO: restore before remove webpacker
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
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  gem 'letter_opener'
  gem 'listen', '~> 3.7'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'rubocop', require: false
  gem 'rubocop-minitest', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
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
