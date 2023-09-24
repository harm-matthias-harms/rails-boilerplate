# frozen_string_literal: true

module Deviseable
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_consent_fields, if: :devise_controller?
    before_action :set_current_user, if: :user_signed_in?
    after_action :verify_authorized, except: :index, unless: :devise_controller?
    after_action :verify_policy_scoped, only: :index, unless: :devise_controller?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [consents_attributes: %i[consent accepted type ip user_agent]])
  end

  def set_consent_fields
    return if params.dig(:user, :consents_attributes).blank?

    params[:user][:consents_attributes].each do |_, consent|
      consent[:ip] = request.remote_ip
      consent[:user_agent] = request.user_agent
    end
  end

  def set_current_user
    Current.user = current_user
  end
end
