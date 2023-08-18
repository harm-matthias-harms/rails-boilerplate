# frozen_string_literal: true

module TailwindFormBuilder::Input
  include TailwindFormBuilder::Base
  include TailwindFormBuilder::Label

  %i[text_field number_field email_field password_field phone_field date_field
     datetime_field].each do |method|
       define_method("labeled_#{method}") do |attribute, options = {}|
         labeled_input(method, attribute, options)
       end
     end

  private

  def labeled_input(method, attribute, options = {})
    form_control do
      label(attribute) +
        input(method, attribute, options) +
        errors(attribute)
    end
  end

  def input(method, attribute, options = {})
    options[:class] = ['input input-bordered w-full max-w-xs', errors?(attribute) && 'input-error']
    options[:required] = required?(attribute)
    options[:aria] = { required: required?(attribute) }

    send(method, attribute, options)
  end
end
