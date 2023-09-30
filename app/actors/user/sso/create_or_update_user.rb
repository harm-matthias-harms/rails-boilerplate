# frozen_string_literal: true

class User::Sso::CreateOrUpdateUser < Actor
  input :identity, type: Identity
  input :email, type: String

  output :user, type: User

  def call
    self.user = identity.user || User.find_by(email:)

    self.user = create_user if user.blank?

    identity.user = user
    identity.save!
  end

  private

  def create_user
    user = User.new(email:, password: SecureRandom.urlsafe_base64(64))
    user.skip_confirmation!
    user.save!
    user
  end
end
