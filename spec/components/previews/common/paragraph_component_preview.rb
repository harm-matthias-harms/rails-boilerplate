# frozen_string_literal: true

class Common::ParagraphComponentPreview < ViewComponent::Preview
  def default
    render(Common::ParagraphComponent.new) do
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    end
  end
end
