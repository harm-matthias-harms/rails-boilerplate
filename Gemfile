# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '7.0.7'

# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem 'propshaft', '0.7.0'

# Use postgresql as the database for Active Record
gem 'pg', '1.5.3'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '6.3.1'

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem 'jsbundling-rails', '1.1.2'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails', '1.4.0'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails', '1.2.1'

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem 'cssbundling-rails', '1.2.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder", "2.11.5"

# Use Redis adapter to run Action Cable in production
gem 'redis', '5.0.6'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', '1.2023.3', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '1.16.0', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', '1.8.0', platforms: %i[mri mingw x64_mingw]

  gem 'factory_bot_rails', '6.2.0'
  gem 'rspec-rails', '6.0.3'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console', '4.2.0'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  gem 'listen', '3.8.0'
  gem 'lookbook', '2.0.5'

  gem 'annotate', '3.2.0', require: false
  gem 'brakeman', '6.0.1', require: false
  gem 'database_consistency', '1.7.18', require: false
  gem 'haml_lint', '0.49.3', require: false
  gem 'i18n-tasks', '1.0.12', require: false
  gem 'rubocop', '1.56.0', require: false
  gem 'rubocop-capybara', '2.18.0', require: false
  gem 'rubocop-factory_bot', '2.23.1', require: false
  gem 'rubocop-performance', '1.19.0', require: false
  gem 'rubocop-rails', '2.20.2', require: false
  gem 'rubocop-rspec', '2.23.2', require: false
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara', '3.39.2'
  gem 'database_cleaner-active_record', '2.1.0'
  gem 'fuubar', '2.5.1', require: false
  gem 'selenium-webdriver', '4.11.0'
  gem 'shoulda-matchers', '5.3.0', require: false
  gem 'simplecov', '0.22.0', require: false
  gem 'simplecov-cobertura', '2.1.0'
end

gem 'active_record_doctor', '1.12.0'
gem 'active_storage_validations', '1.0.4'
gem 'config', '4.2.1'
gem 'haml-rails', '2.1.0'
gem 'pundit', '2.3.1'
gem 'service_actor', '3.7.0'
gem 'service_actor-rails', '1.0.0'
gem 'sidekiq', '7.1.2'
gem 'view_component', '3.5.0'
