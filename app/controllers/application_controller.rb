# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Flashable
  include Deviseable
  include Pundit::Authorization

  protect_from_forgery prepend: true, with: :exception

  default_form_builder TailwindFormBuilder

  rescue_from(ActionController::UnknownFormat) do
    head :unsupported_media_type
  end

  rescue_from(ActionDispatch::Cookies::CookieOverflow) do
    head :request_header_fields_too_large
  end
end
