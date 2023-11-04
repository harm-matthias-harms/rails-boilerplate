# frozen_string_literal: true

require 'spec_helper'

RSpec.describe User::SingleSignOn, type: :actor do
  subject(:actor) { described_class.result(auth:, provider:) }

  let(:provider) { :google_oauth2 }
  let(:email) { Faker::Internet.email }
  let(:auth) { OmniAuth::AuthHash.new(provider:, uid: '1234567890', info: { email: }) }

  describe '.result' do
    it { is_expected.to be_a_success }
  end
end
