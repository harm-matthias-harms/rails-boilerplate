# frozen_string_literal: true

class User::SingleSignOn < ApplicationActor
  play User::Sso::UnifyProviderData,
       User::Sso::FindOrInitializeIdentity,
       User::Sso::CreateOrUpdateUser
end
