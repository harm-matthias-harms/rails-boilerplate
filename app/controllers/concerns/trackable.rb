# frozen_string_literal: true

module Trackable
  extend ActiveSupport::Concern

  included do
    before_action :track_action
  end

  private

  def track_action
    ahoy.track 'Requested route', request.path_parameters.merge({ format: request.format.to_s })
  end
end
