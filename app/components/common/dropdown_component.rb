# frozen_string_literal: true

class Common::DropdownComponent < ApplicationComponent
  attr_reader :direction, :align

  renders_one :label, Common::LinkComponent
  renders_many :entries, Common::LinkComponent

  def align_class
    'dropdown-end' if align&.to_sym == :end
  end

  def direction_class
    case direction&.to_sym
    when :top
      'dropdown-top'
    when :right
      'dropdown-right'
    when :left
      'dropdown-left'
    else
      'dropdown-bottom'
    end
  end
end
