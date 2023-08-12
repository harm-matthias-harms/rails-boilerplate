# frozen_string_literal: true

class Layout::FooterComponentPreview < ViewComponent::Preview
  def default
    render(Layout::FooterComponent.new)
  end
end
