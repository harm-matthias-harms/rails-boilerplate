# frozen_string_literal: true

RSpec.describe SubscriptionsController do
  subject { response }

  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET /index' do
    before do
      allow_any_instance_of(Pay::Customer).to( # rubocop:disable RSpec/AnyInstance
        receive(:billing_portal).and_return(Struct.new(:url).new('https://example.com'))
      )
      get subscriptions_path
    end

    it { is_expected.to redirect_to('https://example.com') }
  end

  describe 'GET /new' do
    let(:success) { true }

    before do
      mock_actor(Pay::CreateCheckout, result: { checkout_session: Struct.new(:url).new('https://example.com') },
                                      success:)
      get new_subscription_path
    end

    it { is_expected.to redirect_to('https://example.com') }

    context 'when actor fails' do
      let(:success) { false }

      it { is_expected.to redirect_to(root_path) }
      it { expect(flash[:error]).to eq('Something went wrong. Please try again.') }
    end
  end
end
