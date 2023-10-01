# frozen_string_literal: true

require 'spec_helper'

RSpec.describe User::Sso::UnifyProviderData, type: :actor do
  subject(:actor) { described_class.result(auth:, provider:) }

  let(:provider) { :google_oauth2 }
  let(:auth) { OmniAuth::AuthHash.new(provider:, uid: '1234567890', info: { email: Faker::Internet.email }) }

  it { is_expected.to be_a_success }
  it { expect(actor.uid).to eq(auth.uid) }
  it { expect(actor.email).to eq(auth.info.email) }
end
