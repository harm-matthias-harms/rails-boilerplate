# frozen_string_literal: true

class Common::ImageComponent < ApplicationComponent
  attr_reader :src, :alt, :width, :height, :shadow

  alias shadow? shadow
end
