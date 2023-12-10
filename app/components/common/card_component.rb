# frozen_string_literal: true

class Common::CardComponent < ApplicationComponent
  renders_one :heading, -> { Common::HeadingComponent.new(tag: :h3) }
  renders_one :list, -> { Common::ListComponent.new(icon: :checkmark) }
  renders_one :action, ->(**kwargs) { Common::LinkComponent.new(button: :primary, classes: 'btn-wide', **kwargs) }
end
