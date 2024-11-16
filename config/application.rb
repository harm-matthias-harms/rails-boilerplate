# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Configuration for the application, engines, and railties goes here.
#
# These settings can be overridden in specific environments using the files
# in config/environments, which are processed later.
#
# config.time_zone = "Central Time (US & Canada)"
# config.eager_load_paths << Rails.root.join("extras")
module RailsBoilerplate # rubocop:disable Style/ClassAndModuleChildren
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    config.active_job.queue_adapter = :good_job

    config.generators do |generate|
      generate.orm :active_record, primary_key_type: :uuid

      generate.assets false
      generate.helper false
      generate.stylesheets false
      generate.view_specs false
    end

    config.view_component.generate.preview = true
    config.view_component.preview_paths << Rails.root.join('spec/components/previews')
    config.view_component.default_preview_layout = 'component_preview'

    config.action_mailer.default_url_options = { host: Settings.app.host }
    config.action_mailer.asset_host = Settings.app.host

    config.i18n.available_locales = %i[en]
    config.i18n.default_locale = :en

    config.exceptions_app = routes

    config.require_master_key = false
    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
