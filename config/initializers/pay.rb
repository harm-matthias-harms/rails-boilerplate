# frozen_string_literal: true

unless Rails.env.test?
  module Pay::Stripe
    def self.public_key
      Settings.pay.stripe.public_key
    end

    def self.private_key
      Settings.pay.stripe.secret_key
    end

    def self.signing_secret
      Settings.pay.stripe.signing_secret
    end
  end
end

Pay.setup do |config|
  config.automount_routes = true
  config.enabled_processors = [Settings.pay.default_processor.to_sym]
end
