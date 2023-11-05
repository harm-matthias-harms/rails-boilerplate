# frozen_string_literal: true

class Common::HeroComponent < ApplicationComponent
  renders_one :heading, -> { Common::HeadingComponent.new(tag: :h1) }
  renders_one :paragraph, Common::ParagraphComponent
  renders_one :image, ->(**kwargs) { Common::ImageComponent.new(shadow: true, **kwargs) }
  renders_many :actions, Common::LinkComponent
end
