# frozen_string_literal: true

class Layout::NotificationComponentPreview < ViewComponent::Preview
  # @!group default
  def info
    render(Layout::NotificationComponent.new(message: 'Model saved', type: :info))
  end

  def success
    render(Layout::NotificationComponent.new(message: 'Model saved', type: :success))
  end

  def error
    render(Layout::NotificationComponent.new(message: 'Model saved', type: :error))
  end

  # @!endgroup
end
