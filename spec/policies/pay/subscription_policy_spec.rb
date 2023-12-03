require 'rails_helper'

RSpec.describe Pay::SubscriptionPolicy, type: :policy do
  subject(:policy) { described_class }

  let(:user) { build(:user) }

  permissions :index? do
    it { is_expected.to permit(user, nil) }

    context 'when user has no pay_customer' do
      let(:user) { create(:user, :without_pay_customer) }

      it { is_expected.not_to permit(user, nil) }
    end
  end

  permissions :new? do
    it { is_expected.to permit(user, nil) }

    context 'when user has subscription' do
      let(:user) { create(:user, :with_subscription) }

      it { is_expected.not_to permit(user, nil) }
    end
  end

  permissions :index?, :new? do
    it { is_expected.not_to permit(nil, nil) }
  end
end
