# frozen_string_literal: true

class IdentityPolicy < ApplicationPolicy
  def destroy?
    record&.user == user
  end
end
