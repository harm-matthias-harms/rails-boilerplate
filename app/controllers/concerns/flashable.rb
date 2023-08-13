# frozen_string_literal: true

module Flashable
  private

  def set_flash(status, model: nil)
    message = I18n.t("helpers.flash.#{controller_path}.#{action_name}.#{status}",
                     default: I18n.t("helpers.flash.#{action_name}.#{status}"),
                     model:)

    if turbo_frame_request?
      flash.now[status] = message
    else
      flash[status] = message
    end
  end
end
