# frozen_string_literal: true

module TailwindFormBuilder::Label
  include ActionView::Helpers::OutputSafetyHelper
  include TailwindFormBuilder::Base

  private

  def label(attribute, text = nil, options = {}, &)
    super(attribute, text, label_options(attribute, options)) do |builder|
      template.tag.span(class: ['label-text font-bold', required?(attribute) && "after:content-['*']"]) do
        block_given? ? template.capture(builder, &) : text || builder.translation
      end
    end
  end

  def errors(attribute)
    template.label(object_name, attribute, nil, objectify_options({ class: 'label text-xs' })) do
      template.tag.span(class: 'label-text text-error') do
        safe_join(object.errors[attribute].map do |msg|
          template.tag.p { msg }
        end)
      end
    end
  end

  def errors?(attribute)
    object.errors&.[](attribute)&.any?
  end

  def label_options(attribute, options = {})
    {
      enabled: true,
      required: required?(attribute),
      class: 'label'
    }.merge(options.delete(:label) || {}).compact
  end
end
