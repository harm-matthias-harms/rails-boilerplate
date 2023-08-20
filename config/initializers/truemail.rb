# frozen_string_literal: true

Truemail.configure do |config|
  config.verifier_email = Settings.mail.sender
  config.smtp_fail_fast = true
  config.smtp_safe_check = true
  config.connection_timeout = 1
  config.response_timeout = 1
  config.blacklisted_domains = YAML.load(File.open(Rails.root.join('config/truemail.yml')))['blacklisted_domains']
end
