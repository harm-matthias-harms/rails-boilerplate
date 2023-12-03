# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def index
    skip_policy_scope
    authorize Pay::Subscription

    redirect_to current_user.payment_processor.billing_portal.url, status: :see_other, allow_other_host: true
  end

  def new
    authorize Pay::Subscription

    @checkout = Pay::CreateCheckout.result(user: current_user,
                                           success_url: root_url,
                                           cancel_url: request.referer || root_url)
    if @checkout.success?
      redirect_to @checkout.checkout_session.url, status: :see_other, allow_other_host: true
    else
      set_flash(:error)
      redirect_back fallback_location: root_url
    end
  end
end
