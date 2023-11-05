# frozen_string_literal: true

class Common::HeroComponent < ApplicationComponent
  renders_one :heading, Common::HeadingComponent
  renders_one :paragraph, Common::ParagraphComponent
  renders_one :image, Common::ImageComponent
  renders_many :actions, Common::LinkComponent
end
