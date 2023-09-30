# frozen_string_literal: true

RSpec.describe 'Users::OmniauthCallbacks' do
  subject(:response) { get url }

  let(:email) { Faker::Internet.email }

  before do
    OmniAuth.config.test_mode = true
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  end

  Settings.sso.each do |provider, _|
    describe "GET /users/auth/#{provider}/callback" do
      let(:url) { "/users/auth/#{provider}/callback" }

      before do
        OmniAuth.config.mock_auth[provider] =
          OmniAuth::AuthHash.new(provider:, uid: '1234567890', info: { email: })
        Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[provider]
      end

      it { expect(response).to redirect_to(root_path) }

      it 'renders flash' do
        response

        expect(flash[:success]).to eq('Successfully authenticated from Google account.')
      end

      context 'when user exists' do
        before { create(:user, email:) }

        it { expect(response).to redirect_to(root_path) }
      end

      context 'when user is signed in' do
        before { sign_in create(:user, email:) }

        it { expect(response).to redirect_to(root_path) }
      end

      context 'with failing actor' do
        before do
          mock_actor(User::SingleSignOn, result: {}, success: false)
        end

        it { expect(response).to redirect_to(new_user_session_path) }

        it 'renders flash' do
          response

          expect(flash[:error]).to eq('Could not authenticate you from Google account.')
        end
      end

      context 'with failing actor when user is signed in' do
        before do
          mock_actor(User::SingleSignOn, result: {}, success: false)
          sign_in create(:user, email:)
        end

        it { expect(response).to redirect_to(root_path) }
      end

      context 'with invalid credentials' do
        before do
          OmniAuth.config.mock_auth[provider] = :invalid_credentials
          Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[provider]
        end

        it { expect(response).to redirect_to(new_user_session_path) }
      end
    end
  end
end
