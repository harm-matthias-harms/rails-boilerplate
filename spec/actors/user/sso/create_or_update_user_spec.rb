# frozen_string_literal: true

require 'spec_helper'

RSpec.describe User::Sso::CreateOrUpdateUser, type: :actor do
  subject(:actor) { described_class.result(identity:, email:) }

  let(:identity) { build(:identity, user: nil) }
  let(:email) { Faker::Internet.email }

  it { is_expected.to be_a_success }
  it { expect(actor.user).to be_a(User) }
  it { expect(actor.user).to be_persisted }
  it { expect(actor.user.email).to eq(email) }
  it { expect(actor.user.identities).to include(identity) }

  context 'when user exists' do
    let(:user) { create(:user) }
    let(:identity) { build(:identity, user: nil) }
    let(:email) { user.email }

    it { is_expected.to be_a_success }
    it { expect(actor.user.email).to eq(email) }
    it { expect(actor.user.identities).to include(identity) }
  end

  context 'when user exists with identity' do
    let(:user) { create(:user) }
    let(:identity) { build(:identity, user:) }
    let(:email) { user.email }

    it { is_expected.to be_a_success }
    it { expect(actor.user.email).to eq(email) }
    it { expect(actor.user.identities).to include(identity) }
  end
end
