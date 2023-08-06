# frozen_string_literal: true

module TailwindFormBuilder::Submit
  include TailwindFormBuilder::Base

  def submit(value = nil, option = {})
    option[:class] = ['btn btn-primary btn-full']

    form_control do
      if any_required?
        required_submit_label
      else
        ''
      end +
        super(value, option)
    end
  end

  private

  def required_submit_label
    template.tag.label(class: 'label') do
      template.tag.span(class: 'text-xs text-neutral') do
        I18n.t('helpers.forms.submit.required')
      end
    end
  end
end
