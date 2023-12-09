# frozen_string_literal: true

class Common::ShowcaseComponent < ApplicationComponent
  attr_reader :rtl

  renders_one :heading, -> { Common::HeadingComponent.new(tag: :h2) }
  renders_one :description, 'Common::ParagraphComponent'
  renders_one :image, ->(**kwargs) { Common::ImageComponent.new(shadow: true, **kwargs) }
  renders_one :list, -> { Common::ListComponent.new(icon: :checkmark) }

  alias rtl? rtl
end
