# frozen_string_literal: true

class ApplicationComponent < ViewComponent::Base
  include ActionView::RecordIdentifier

  include Turbo::FramesHelper
  include Turbo::StreamsHelper

  include ViewComponentsHelper

  attr_reader :classes

  def initialize(**kwargs)
    super
    kwargs.each { |name, value| instance_variable_set("@#{name}", value) }
  end

  def policy(record, policy_class: nil)
    return Pundit.policy(Current.user, record) if policy_class.nil?

    policy_class.new(Current.user, record)
  end
end
