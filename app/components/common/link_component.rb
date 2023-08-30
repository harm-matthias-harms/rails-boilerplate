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

    case button.to_sym
    when :primary
      'btn-primary'
    when :ghost
      'btn-ghost'
    end
  end
end
