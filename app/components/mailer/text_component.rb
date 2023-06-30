# frozen_string_literal: true

class Mailer::TextComponent < ApplicationComponent
  def color
    case @color&.to_sym
    when :primary
      '#057AFF'
    when :gray
      '#C7C9D1'
    else
      '#394E6A'
    end
  end

  def font_size
    @font_size ||= '16px'
  end

  def font_weight
    @font_weight ||= 'normal'
  end

  def font_style
    @font_style ||= 'normal'
  end

  def text_align
    @text_align ||= 'left'
  end

  def padding_bottom
    @padding_bottom ||= '10px'
  end
end
