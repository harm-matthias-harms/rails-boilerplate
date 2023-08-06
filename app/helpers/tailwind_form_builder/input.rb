# frozen_string_literal: true

module TailwindFormBuilder::Input
  include TailwindFormBuilder::Base
  include TailwindFormBuilder::Label

  def labeled_text_field(attribute)
    labeled_input(:text_field, attribute)
  end

  def labeled_number_field(attribute)
    labeled_input(:number_field, attribute)
  end

  def labeled_email_field(attribute)
    labeled_input(:email_field, attribute)
  end

  def labeled_password_field(attribute)
    labeled_input(:password_field, attribute)
  end

  def labeled_phone_field(attribute)
    labeled_input(:phone_field, attribute)
  end

  def labeled_date_field(attribute)
    labeled_input(:date_field, attribute)
  end

  def labeled_datetime_field(attribute)
    labeled_input(:datetime_field, attribute)
  end

  private

  def labeled_input(method, attribute)
    form_control do
      label(attribute) +
        input(method, attribute) +
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
