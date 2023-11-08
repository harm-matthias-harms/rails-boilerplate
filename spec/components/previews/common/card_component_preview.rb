# frozen_string_literal: true

class Common::CardComponentPreview < ViewComponent::Preview
  def default
    render(Common::CardComponent.new) do
      'Content'
    end
  end
end
