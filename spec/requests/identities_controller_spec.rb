# frozen_string_literal: true

RSpec.describe IdentitiesController do
  describe '.destroy' do
    let(:identity) { create(:identity) }

    before do
      sign_in(identity.user)
      delete identity_path(identity)
    end

    it { expect(response).to redirect_to(edit_user_registration_path) }
    it { expect(response).to have_http_status(:see_other) }
    it { expect { identity.reload }.to raise_error(ActiveRecord::RecordNotFound) }
    it { expect(flash[:success]).to eq('Service disconnected successfully.') }

    context 'when the identity cannot be destroyed' do
      before do
        allow(Identity).to receive(:find).with(identity.id.to_s).and_return(identity)
        allow(identity).to receive(:destroy).and_return(false)
        delete identity_path(identity)
      end

      it { expect(response).to redirect_to(edit_user_registration_path) }
      it { expect(response).to have_http_status(:see_other) }
      it { expect(flash[:error]).to eq('Service could not be disconnected.') }
    end
  end
end
