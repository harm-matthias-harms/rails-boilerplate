# frozen_string_literal: true

class Common::LinkComponentPreview < ViewComponent::Preview
  # !startgroup type
  def link
    render(Common::LinkComponent.new(type: :link, href: '#')) { 'Link' }
  end

  def button
    render(Common::LinkComponent.new(type: :button, href: '#')) { 'Button' }
  end

  # !endgroup
end
