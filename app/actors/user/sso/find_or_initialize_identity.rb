# frozen_string_literal: true

class User::Sso::FindOrInitializeIdentity < ActiveRecordActor
  input :provider, type: Symbol, inclusion: Settings.sso.keys
  input :uid, type: String
  input :current_user, type: User, allow_nil: true, default: nil

  output :identity, type: Identity

  def call
    self.identity = Identity.find_or_initialize_by(provider:, uid:)

    return if current_user.blank?
    return fail!(error: :used_by_other_user) if used_by_other_user?

    identity.user = current_user
    identity.save!
  end

  private

  def used_by_other_user?
    identity.user.present? && (identity.user != current_user)
  end
end
