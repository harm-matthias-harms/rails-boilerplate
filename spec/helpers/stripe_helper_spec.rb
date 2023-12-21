# frozen_string_literal: true

RSpec.describe StripeHelper do
  before do
    allow(helper).to(receive(:premium_price)
                       .and_return(Stripe::Price.construct_from({ unit_amount: 1000, currency: 'usd',
                                                                  recurring: { interval: 'month' } })))
  end

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
