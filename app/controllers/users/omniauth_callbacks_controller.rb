# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Flashable

  def omniauth
    auth = request.env['omniauth.auth']
    provider = params[:action].to_sym

    result = User::SingleSignOn.result(auth:, provider:)

    if result.success?
      omniauth_success(result)
    else
      omniauth_failure
    end
  end

  Settings.sso.to_h.each_key do |provider|
    alias_method provider, :omniauth
  end

  private

  def omniauth_success(result)
    set_flash(:success)

    if current_user.present?
      redirect_to request.env['omniauth.origin'] || root_path
    else
      sign_in_and_redirect result.user, event: :authentication
    end
  end

  def omniauth_failure
    set_flash(:error)

    if current_user.present?
      redirect_to request.env['omniauth.origin'] || root_path
    else
      redirect_to new_user_session_path
    end
  end
end
