# frozen_string_literal: true

module Flashable
  private

  def set_flash(status, model:)
    flash[status] = I18n.t("helpers.flash.#{controller_path}.#{action_name}.#{status}",
                           default: I18n.t("helpers.flash.#{action_name}.#{status}"),
                           model:)
  end
end
