# frozen_string_literal: true

class Layout::NotificationComponent < ApplicationComponent
  attr_reader :message

  def type
    {
      info: 'alert-info',
      success: 'alert-success',
      error: 'alert-error'
    }[@type.to_sym]
  end

  def icon
    {
      info: 'fa-info-circle',
      success: 'fa-check-circle',
      error: 'fa-exclamation-circle'
    }[@type.to_sym]
  end

  def timeout
    {
      info: 10_000,
      success: 10_000,
      error: 20_000
    }[@type.to_sym]
  end
end
