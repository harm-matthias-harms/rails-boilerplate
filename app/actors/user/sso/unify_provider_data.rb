# frozen_string_literal: true

class User::Sso::UnifyProviderData < Actor
  input :provider, type: Symbol, inclusion: Settings.sso.keys
  input :auth, type: OmniAuth::AuthHash

  output :uid, type: String
  output :email, type: String

  def call
    self.uid = auth.uid
    self.email = auth.info.email
  end
end
