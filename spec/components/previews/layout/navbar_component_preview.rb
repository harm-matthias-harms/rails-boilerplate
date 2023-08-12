# frozen_string_literal: true

class Layout::NavbarComponentPreview < ViewComponent::Preview
  def default
    render(Layout::NavbarComponent.new)
  end
end
