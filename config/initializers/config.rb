# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
Config.setup do |config|
  # Name of the constant exposing loaded settings
  config.const_name = 'Settings'

  # Ability to remove elements of the array set in earlier loaded settings file. For example value: '--'.
  #
  # config.knockout_prefix = nil

  # Overwrite an existing value when merging a `nil` value.
  # When set to `false`, the existing value is retained after merge.
  #
  # config.merge_nil_values = true

  # Overwrite arrays found in previously loaded settings file. When set to `false`, arrays will be merged.
  #
  # config.overwrite_arrays = true

  # Load environment variables from the `ENV` object and override any settings defined in files.
  #
  config.use_env = true

  # Define ENV variable prefix deciding which variables to load into config.
  #
  # Reading variables from ENV is case-sensitive. If you define lowercase value below, ensure your ENV variables are
  # prefixed in the same way.
  #
  # When not set it defaults to `config.const_name`.
  #
  config.env_prefix = 'SETTINGS'

  # What string to use as level separator for settings loaded from ENV variables. Default value of '.' works well
  # with Heroku, but you might want to change it for example for '__' to easy override settings from command line, where
  # using dots in variable names might not be allowed (eg. Bash).
  #
  config.env_separator = '__'

  # Ability to process variables names:
  #   * nil  - no change
  #   * :downcase - convert to lower case
  #
  # config.env_converter = :downcase

  # Parse numeric values as integers instead of strings.
  #
  # config.env_parse_values = true

  # Validate presence and type of specific config values. Check https://github.com/dry-rb/dry-validation for details.
  if ENV.fetch('SETTINGS_SKIP_VALIDATION', false)
    ENV['SECRET_KEY_BASE'] = SecureRandom.hex(64)
  else
    config.schema do
      required(:app).schema do
        required(:name).filled(:string)
        required(:host).filled(:string)
      end
      required(:database).schema do
        required(:host).filled(:string)
        required(:port).filled(:integer)
        required(:username).filled(:string)
        required(:password).filled(:string)
      end
      required(:mail).schema do
        required(:sender).filled(:string)
        required(:support).filled(:string)
        unless Rails.env.test?
          required(:address).filled(:string)
          required(:port).filled(:integer)
          required(:username).filled(:string)
          required(:password).filled(:string)
          required(:authentication).filled(:string)
          required(:enable_starttls_auto).filled(:bool)
        end
      end
      required(:redis).schema do
        required(:url).filled(:string)
      end
      if Rails.env.production?
        required(:s3).schema do
          required(:endpoint).filled(:string)
          required(:region).filled(:string)
          required(:bucket).filled(:string)
          required(:access_key_id).filled(:string)
          required(:secret_access_key).filled(:string)
        end
      end
      required(:sso).schema do
        required(:google_oauth2).schema do
          required(:client_id).filled(:string)
          required(:client_secret).filled(:string)
        end
      end
    end
  end

  # Fail loudly when trying to access a non-existent setting.
  #
  config.fail_on_missing = true

  # Evaluate ERB in YAML config files at load time.
  #
  config.evaluate_erb_in_yaml = true
end
# rubocop:enable Metrics/BlockLength
