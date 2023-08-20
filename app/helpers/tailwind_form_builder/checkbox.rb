# frozen_string_literal: true

module TailwindFormBuilder::Checkbox
  include TailwindFormBuilder::Base
  include TailwindFormBuilder::Label

  def labeled_check_box(attribute, options = {})
    form_control do
      label(attribute, nil, { class: 'cursor-pointer justify-start' }) do
        check_box(attribute, options)
      end +
        errors(attribute)
    end
  end

  private

  def check_box(attribute, options = {})
    options[:class] = ['checkbox checkbox-primary mr-2', errors?(attribute) && 'input-error']
    options[:required] = required?(attribute)
    options[:aria] = { required: required?(attribute) }

    super(attribute, options)
  end
end
