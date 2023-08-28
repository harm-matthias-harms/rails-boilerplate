# frozen_string_literal: true

class Common::HeadingComponentPreview < ViewComponent::Preview
  # @!group tags

  def h1
    render(Common::HeadingComponent.new(tag: :h1)) { 'This is a h1 tag' }
  end

  def h2
    render(Common::HeadingComponent.new(tag: :h2)) { 'This is a h2 tag' }
  end

  def h3
    render(Common::HeadingComponent.new(tag: :h3)) { 'This is a h3 tag' }
  end

  def h4
    render(Common::HeadingComponent.new(tag: :h4)) { 'This is a h4 tag' }
  end

  def h5
    render(Common::HeadingComponent.new(tag: :h5)) { 'This is a h5 tag' }
  end

  def h6
    render(Common::HeadingComponent.new(tag: :h6)) { 'This is a h6 tag' }
  end

  # @!endgroup
end
