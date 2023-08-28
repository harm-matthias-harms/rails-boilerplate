# frozen_string_literal: true

class Common::LinkComponent < ApplicationComponent
  attr_reader :type, :href

  def type_classes
    {
      link: 'link link-hover link-primary',
      button: 'btn'
    }[type.to_sym]
  end
end
