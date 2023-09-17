# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Flashable
  include Pundit::Authorization

  before_action :set_current_user, if: :user_signed_in?
  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_controller?

  protect_from_forgery prepend: true, with: :exception

  default_form_builder TailwindFormBuilder

  rescue_from(ActionController::UnknownFormat) do
    head :unsupported_media_type
  end

  rescue_from(ActionDispatch::Cookies::CookieOverflow) do
    head :request_header_fields_too_large
  end

  private

  def set_current_user
    Current.user = current_user
  end
end
