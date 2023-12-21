# frozen_string_literal: true

RSpec.describe StripeHelper do
  describe '.premium_amount' do
    it { expect(helper.premium_amount).to eq(10.0) }
  end

  describe '.premium_interval' do
    it { expect(helper.premium_interval).to eq('month') }
  end

  describe '.premium_currency' do
    it { expect(helper.premium_currency).to eq('$') }
  end
end
