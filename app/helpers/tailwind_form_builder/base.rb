# frozen_string_literal: true

module TailwindFormBuilder::Base
  private

  def form_control(&)
    template.tag.div(class: 'form-control w-full max-w-xs mb-2', &)
  end

  def required?(attribute)
    required_fields[attribute] ||= object.is_a?(ActiveModel::Validations) &&
                                   object._validators[attribute]&.any?(ActiveModel::Validations::PresenceValidator)
  end

  def any_required?
    required_fields.any? { |_k, v| v }
  end

  def required_fields
    @required_fields ||= {}
  end
end
