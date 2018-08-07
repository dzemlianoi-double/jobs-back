# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'active_admin_theme'
gem 'active_model_serializers'
gem 'activeadmin'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'cancancan'
gem 'devise'
gem 'draper'
gem 'email_validator'
gem 'mini_magick', '~> 4.8'
gem 'pg'
gem 'phonelib'
gem 'puma', '~> 3.11'
gem 'rack-cors'
gem 'rails', '~> 5.2.0'
gem 'redis', '~> 4.0'

group :development, :test do
  gem 'pry', platforms: %i[mri mingw x64_mingw]
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  gem 'brakeman'
  gem 'bullet'
  gem 'bundler-audit'
  gem 'capistrano-rails'
  gem 'fasterer'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'overcommit'
  gem 'rails_best_practices'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-rspec'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'rspec'
end
