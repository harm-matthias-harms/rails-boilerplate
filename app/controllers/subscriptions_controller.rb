# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def new
    skip_authorization # authorize Pay::Subscription

    # Todo add more checkout options to prevent refunds, like tos, etc.
    @checkout_session = current_user.payment_processor.checkout(
      mode: :subscription,
      locale: I18n.locale,
      line_items: [
        {
          price: Settings.pay.stripe.subscription.premium,
          quantity: 1
        }
      ],
      subscription_data: {
        metadata: {
          pay_name: :premium
        }
      },
      success_url: root_url,
      cancel_url: request.referer || root_url
    )

    redirect_to @checkout_session.url, status: :see_other, allow_other_host: true
  end
end
