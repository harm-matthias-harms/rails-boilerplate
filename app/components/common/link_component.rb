# frozen_string_literal: true

class Common::LinkComponent < ApplicationComponent
  attr_reader :link, :button, :href, :data

  def type
    return :link if link.present?

    :button if button.present?
  end

  def type_classes
    {
      link: 'link link-hover link-primary',
      button: 'btn'
    }[type]
  end

  def button_class
    return unless type == :button
    return if button == true

    {
      primary: 'btn-primary',
      ghost: 'btn-ghost',
      block: 'btn-block'
    }[button.to_sym]
  end
end
