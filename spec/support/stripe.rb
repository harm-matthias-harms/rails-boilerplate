# frozen_string_literal: true

RSpec.configure do |config|
  config.before do
    allow_any_instance_of(StripeHelper).to( # rubocop:disable RSpec/AnyInstance
      receive(:premium_price)
        .and_return(Stripe::Price.construct_from({ unit_amount: 1000, currency: 'usd',
                                                   recurring: { interval: 'month' } }))
    )
  end
end
