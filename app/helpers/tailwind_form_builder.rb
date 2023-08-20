# frozen_string_literal: true

class TailwindFormBuilder < ActionView::Helpers::FormBuilder
  include Input
  include Checkbox
  include Submit

  attr_reader :template
end
