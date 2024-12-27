# frozen_string_literal: true

Rails.application.configure do |config|
  break if Rails.env.development?

  config.hotwire.spark.html_paths += ['app/components']
  config.hotwire.spark.stimulus_paths += ['app/components']
  config.hotwire.spark.html_extensions += ['haml']
end
