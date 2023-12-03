# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Flashable
  include Deviseable
  include Trackable
  include Pundit::Authorization

  protect_from_forgery prepend: true, with: :exception

  def default_form_builder
    if controller_path.start_with?('blazer')
      super
    else
      TailwindFormBuilder
    end
  end

  rescue_from(ActionController::UnknownFormat) do
    head :unsupported_media_type
  end

  rescue_from(ActionDispatch::Cookies::CookieOverflow) do
    head :request_header_fields_too_large
  end

  rescue_from(Pundit::NotAuthorizedError) do
    if current_user.present?
      redirect_to root_url, alert: t('helpers.pundit.not_authorized')
    else
      redirect_to new_user_session_url, alert: t('helpers.pundit.not_authenticated')
    end
  end
end
