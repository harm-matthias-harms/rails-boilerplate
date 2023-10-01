# frozen_string_literal: true

RSpec.describe IdentityPolicy, type: :policy do
  subject(:policy) { described_class }

  let(:user) { build(:user) }

  permissions :destroy? do
    it 'grants access if user is owner' do
      record = build(:identity, user:)

      expect(policy).to permit(user, record)
    end

    it 'denies access if user is not owner' do
      record = build(:identity, user: build(:user))

      expect(policy).not_to permit(user, record)
    end

    it 'denies access if user is not logged in' do
      record = build(:identity, user: build(:user))

      expect(policy).not_to permit(nil, record)
    end

    it 'denies access if record is nil' do
      expect(policy).not_to permit(user, nil)
    end
  end
end
