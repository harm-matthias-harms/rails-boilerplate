# frozen_string_literal: true

module TailwindFormBuilder::Label
  include ActionView::Helpers::OutputSafetyHelper
  include TailwindFormBuilder::Base

  private

  def label(attribute, text = nil, options = {}, &)
    super(attribute, text, label_options(attribute, options)) do |builder|
      label = template.tag.span(class: ['label-text font-bold', required?(attribute) && "after:content-['*']"]) do
        text || builder.translation
      end

      safe_join([block_given? && template.capture(builder, &), label].select(&:itself))
    end
  end

  def errors(attribute)
    return unless errors?(attribute)

    template.label(object_name, attribute, nil, objectify_options({ class: 'label text-xs' })) do
      template.tag.span(class: 'label-text text-error') do
        safe_join(object.errors[attribute].map { |msg| template.tag.p { msg } })
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
      class: ['label', options.delete(:class)]
    }
  end
end
