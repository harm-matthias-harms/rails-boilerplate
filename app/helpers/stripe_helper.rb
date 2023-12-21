# frozen_string_literal: true

module StripeHelper
  def premium_amount
    premium_price.unit_amount / 100.0
  end

  def premium_interval
    t("helpers.time.#{premium_price.recurring.interval}")
  end

  def premium_currency
    t("helpers.currency.#{premium_price.currency}")
  end

  private

  def premium_price
    @premium_price ||= Stripe::Price.retrieve(Settings.pay.stripe.subscription.premium)
  end
end
