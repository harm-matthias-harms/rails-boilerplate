# frozen_string_literal: true

class Common::ImageComponentPreview < ViewComponent::Preview
  def default
    render(Common::ImageComponent.new(src: 'https://picsum.photos/seed/picsum/200/300', alt: 'Lorem Ipsum', width: 200,
                                      height: 300))
  end
end
