# frozen_string_literal: true

class Common::LinkComponentPreview < ViewComponent::Preview
  # @!group type
  def link
    render(Common::LinkComponent.new(link: true, href: '#')) { 'Link' }
  end

  def button
    render(Common::LinkComponent.new(button: true, href: '#')) { 'Button' }
  end

  def button_primary
    render(Common::LinkComponent.new(button: :primary, href: '#')) { 'Button' }
  end

  def button_ghost
    render(Common::LinkComponent.new(button: :ghost, href: '#')) { 'Button' }
  end

  # @!endgroup
end
