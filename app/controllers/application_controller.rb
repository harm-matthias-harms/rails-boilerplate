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
end
