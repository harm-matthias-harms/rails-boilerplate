# frozen_string_literal: true

module TailwindFormBuilder::Submit
  include TailwindFormBuilder::Base

  def submit(value = nil, option = {})
    option[:class] = ['btn btn-primary btn-full']

    form_control do
      [required_submit_label, super(value, option)].join.html_safe # rubocop:disable Rails/OutputSafety
    end
  end

  private

  def required_submit_label
    return unless any_required?

    template.tag.label(class: 'label') do
      template.tag.span(class: 'text-xs text-neutral') do
        I18n.t('helpers.forms.submit.required')
      end
    end
  end
end
