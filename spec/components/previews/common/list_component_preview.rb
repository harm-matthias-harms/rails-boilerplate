# frozen_string_literal: true

class Common::ListComponentPreview < ViewComponent::Preview
  # @!group icons
  def default
    render(Common::ListComponent.new) do |list|
      list.with_item { 'Item 1' }
      list.with_item { 'Item 2' }
      list.with_item { 'Item 3' }
    end
  end

  def checkmark
    render(Common::ListComponent.new(icon: :checkmark)) do |list|
      list.with_item { 'Item 1' }
      list.with_item { 'Item 2' }
      list.with_item { 'Item 3' }
    end
  end

  # @endgroup
end
