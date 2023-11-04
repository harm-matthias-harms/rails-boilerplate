# frozen_string_literal: true

require 'spec_helper'

RSpec.describe User::Sso::FindOrInitializeIdentity, type: :actor do
  subject(:actor) { described_class.result(provider:, uid:) }

  let(:provider) { :google_oauth2 }
  let(:uid) { '1234567890' }

  describe '.result' do
    it { is_expected.to be_a_success }
    it { expect(actor.identity).to be_a(Identity) }
    it { expect(actor.identity.provider).to eq(provider.to_s) }
    it { expect(actor.identity.uid).to eq(uid) }
    it { expect(actor.identity.user).to be_nil }
    it { expect(actor.identity).to be_new_record }

    context 'with current_user' do
      subject(:actor) { described_class.result(provider:, uid:, current_user:) }

      let(:current_user) { create(:user) }

      it { is_expected.to be_a_success }
      it { expect(actor.identity.user).to eq(current_user) }
      it { expect(actor.identity).to be_persisted }
    end

    context 'with existing identity' do
      subject(:actor) { described_class.result(provider:, uid:, current_user:) }

      let(:current_user) { create(:user) }
      let!(:identity) { create(:identity, provider:, uid:, user: current_user) }

      it { is_expected.to be_a_success }
      it { expect(actor.identity).to eq(identity) }
    end

    context 'when used by another user' do
      subject(:actor) { described_class.result(provider:, uid:, current_user:) }

      let(:current_user) { create(:user) }

      before { create(:identity, provider:, uid:) }

      it { is_expected.to be_a_failure }
      it { expect(actor.error).to eq(:used_by_other_user) }
    end
  end
end
