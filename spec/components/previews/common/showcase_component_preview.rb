# frozen_string_literal: true

class Common::ShowcaseComponentPreview < ViewComponent::Preview
  # @!group directions
  def default
    render(Common::ShowcaseComponent.new) do |showcase|
      showcase.with_heading { 'Best in class' }
      showcase.with_description { 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' }
      showcase.with_image(src: 'https://picsum.photos/seed/picsum/500/300', alt: 'Lorem ipsum', width: 500, height: 300)
      showcase.with_list do |list|
        list.with_item { 'Lorem ipsum dolor sit amet' }
        list.with_item { 'Consectetur adipiscing elit' }
        list.with_item { 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua' }
      end
    end
  end

  def rtl
    render(Common::ShowcaseComponent.new(rtl: true)) do |showcase|
      showcase.with_heading { 'Best in class' }
      showcase.with_description { 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' }
      showcase.with_image(src: 'https://picsum.photos/seed/picsum/500/300', alt: 'Lorem ipsum', width: 500, height: 300)
      showcase.with_list do |list|
        list.with_item { 'Lorem ipsum dolor sit amet' }
        list.with_item { 'Consectetur adipiscing elit' }
        list.with_item { 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua' }
      end
    end
  end

  # @!endgroup
end
