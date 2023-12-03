# frozen_string_literal: true

RSpec.describe Pay::SubscriptionPolicy, type: :policy do
  subject(:policy) { described_class }

  let(:user) { build(:user) }

  permissions :index? do
    it { is_expected.to permit(user, nil) }
  end

  permissions :new? do
    it { is_expected.to permit(user, nil) }

    context 'when user has subscription' do
      let(:user) { create(:user, :with_premium_subscription) }

      it { is_expected.not_to permit(user, nil) }
    end
  end

  permissions :premium? do
    it { is_expected.not_to permit(user, nil) }

    context 'when user has premium subscription' do
      let(:user) { create(:user, :with_premium_subscription) }

      it { is_expected.to permit(user, nil) }
    end
  end

  permissions :index?, :new?, :premium? do
    it { is_expected.not_to permit(nil, nil) }
  end
end
