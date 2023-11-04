# frozen_string_literal: true

RSpec.describe IdentityPolicy, type: :policy do
  subject(:policy) { described_class }

  let(:user) { build(:user) }

  permissions :destroy? do
    it { is_expected.to permit(user, build(:identity, user:)) }
    it { is_expected.not_to permit(user, build(:identity, user: build(:user))) }
    it { is_expected.not_to permit(nil, build(:identity, user: build(:user))) }
    it { is_expected.not_to permit(user, nil) }
  end
end
