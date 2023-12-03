# frozen_string_literal: true

ENV['STRIPE_PUBLIC_KEY'] = Settings.pay.stripe.public_key
ENV['STRIPE_PRIVATE_KEY'] = Settings.pay.stripe.secret_key
ENV['STRIPE_SIGNING_SECRET'] = Settings.pay.stripe.signing_secret

Pay.setup do |config|
  config.business_name = Settings.pay.business.name
  config.business_address = Settings.pay.business.address
  config.application_name = Settings.app.name
  config.support_email = Settings.mail.support

  config.automount_routes = true
  config.enabled_processors = [:stripe]

  config.send_emails = false
end
