# frozen_string_literal: true

class ApplicationComponent < ViewComponent::Base
  include ActionView::RecordIdentifier

  include Turbo::FramesHelper
  include Turbo::StreamsHelper

  include ViewComponentsHelper

  def initialize(**kwargs)
    super
    kwargs.each { |name, value| instance_variable_set("@#{name}", value) }
  end
end
