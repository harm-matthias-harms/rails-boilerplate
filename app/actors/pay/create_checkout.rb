# frozen_string_literal: true

class Pay::CreateCheckout < Actor
  input :user, type: User
  input :success_url, type: String
  input :cancel_url, type: String

  output :checkout_session, type: Stripe::Checkout::Session

  def call
    self.checkout_session = user.payment_processor.checkout(
      mode: :subscription,
      locale: I18n.locale,
      line_items:,
      subscription_data:,
      success_url:,
      cancel_url:
    )
  end

  private

  def line_items
    [
      {
        price: Settings.pay.stripe.subscription.premium,
        quantity: 1
      }
    ]
  end

  def subscription_data
    {
      metadata: {
        pay_name: :premium
      }
    }
  end
end
