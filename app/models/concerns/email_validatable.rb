# frozen_string_literal: true

module EmailValidatable
  extend ActiveSupport::Concern

  included do
    validate :validate_email_by_truemail
  end

  private

  def validate_email_by_truemail
    errors.add(:email) unless Truemail.valid?(email, with: :mx_blacklist)
  end
end
