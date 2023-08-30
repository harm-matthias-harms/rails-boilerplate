# frozen_string_literal: true

class Common::DropdownComponentPreview < ViewComponent::Preview
  def default
    render(Common::DropdownComponent.new) do |dropdown|
      dropdown.with_label(button: :ghost) { 'Dropdown' }
      dropdown.with_entry(href: '#') { 'Entry 1' }
      dropdown.with_entry(href: '#') { 'Entry 2' }
      dropdown.with_entry(href: '#') { 'Entry 3' }
    end
  end
end
