# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 7.0.2', '>= 7.0.2.3'

gem 'dotenv-rails'

gem 'sprockets-rails'

gem 'sqlite3', '~> 1.4'

gem 'puma', '~> 5.0'

gem 'importmap-rails'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'jbuilder'

gem 'redis', '~> 4.0'

# gem "kredis"

# gem 'bcrypt', '~> 3.1.7'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false

# gem "sassc-rails"

# gem "image_processing", "~> 1.2"
gem 'rubocop'
gem 'rubocop-performance'
gem 'rubocop-rails'
gem 'rubocop-require_tools', '~> 0.1.2'
gem 'rubocop-rspec'

gem 'devise', '~> 4.0'

gem 'cancancan'

gem 'doorkeeper'

gem 'sidekiq'

gem 'sinatra', require: false

gem 'whenever', require: false

# gem 'faraday'

gem 'faraday-retry'

gem 'cocoon'

gem 'octokit', '~> 4.0'

gem 'validate_url'

gem 'rails-i18n', '~> 7.0.0'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails', git: 'git@github.com:rspec/rspec-rails.git', branch: '6-0-maintenance'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  gem 'letter_opener'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'database_cleaner-active_record'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 5.1.0'
  gem 'webdrivers'
end
