# frozen_string_literal: true

class Pay::SubscriptionPolicy < ApplicationPolicy
  def index?
    user.present? && user.payment_processor.pay_customer.present?
  end

  def new?
    user.present? && user.payment_processor.subscription.blank?
  end
end
