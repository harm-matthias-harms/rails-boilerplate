# frozen_string_literal: true

class Common::ShowcaseComponent < ApplicationComponent
  renders_one :heading, -> { Common::HeadingComponent.new(tag: :h2) }
  renders_one :description, 'Common::ParagraphComponent'
  renders_one :image, 'Common::ImageComponent'
  renders_one :list, -> { Common::ListComponent.new(icon: :checkmark) }
end
