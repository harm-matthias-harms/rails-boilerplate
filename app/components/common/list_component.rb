# frozen_string_literal: true

class Common::ListComponent < ApplicationComponent
  renders_many :items

  def icon
    'fas fa-check' if @icon == :checkmark
  end

  def list_style_type
    'list-disc' if icon.blank?
  end
end
