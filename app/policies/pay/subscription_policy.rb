# frozen_string_literal: true

class Pay::SubscriptionPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def new?
    user.present? && !premium?
  end

  def premium?
    user&.payment_processor&.subscribed?(name: :premium)
  end
end
