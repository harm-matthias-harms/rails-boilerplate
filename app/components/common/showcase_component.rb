# frozen_string_literal: true

class Common::ShowcaseComponent < ApplicationComponent
  attr_reader :rtl

  renders_one :heading, -> { Common::HeadingComponent.new(tag: :h2) }
  renders_one :description, 'Common::ParagraphComponent'
  renders_one :list, -> { Common::ListComponent.new(icon: :checkmark) }
  renders_one :image, lambda { |**kwargs, &block|
    block.present? ? block.call : Common::ImageComponent.new(shadow: true, **kwargs)
  }

  alias rtl? rtl
end
