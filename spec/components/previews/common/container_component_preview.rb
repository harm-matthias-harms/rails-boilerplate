# frozen_string_literal: true

class Common::ContainerComponentPreview < ViewComponent::Preview
  def default
    render(Common::ContainerComponent.new) { 'Hello, World!' }
  end
end
