# frozen_string_literal: true

class Common::ImageComponentPreview < ViewComponent::Preview
  # @!group default
  def default
    render(Common::ImageComponent.new(src: 'https://picsum.photos/seed/picsum/200/300', alt: 'Lorem Ipsum', width: 200,
                                      height: 300))
  end

  def shadow
    render(Common::ImageComponent.new(shadow: true, src: 'https://picsum.photos/seed/picsum/200/300',
                                      alt: 'Lorem Ipsum', width: 200, height: 300))
  end

  # @!endgroup
end
