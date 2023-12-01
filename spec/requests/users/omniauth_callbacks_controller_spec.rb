# frozen_string_literal: true

RSpec.describe Users::OmniauthCallbacksController do
  let(:email) { Faker::Internet.email }

  before do
    OmniAuth.config.test_mode = true
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
  end

  Settings.sso.each do |provider, _| # rubocop:disable Style/HashEachMethods
    describe ".#{provider}" do
      before do
        OmniAuth.config.mock_auth[provider] =
          OmniAuth::AuthHash.new(provider:, uid: '1234567890', info: { email: })
        Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[provider]
      end

      context 'when user does not exist' do
        before { get "/users/auth/#{provider}/callback" }

        it { expect(response).to redirect_to(root_path) }
        it { expect(flash[:success]).to eq('Successfully authenticated from Google account.') }
      end

      context 'when user exists' do
        before do
          create(:user, email:)
          get "/users/auth/#{provider}/callback"
        end

        it { expect(response).to redirect_to(root_path) }
      end

      context 'when user is signed in' do
        before do
          sign_in create(:user, email:)
          get "/users/auth/#{provider}/callback"
        end

        it { expect(response).to redirect_to(root_path) }
      end

      context 'with failing actor' do
        before do
          mock_actor(User::SingleSignOn, result: {}, success: false)
          get "/users/auth/#{provider}/callback"
        end

        it { expect(response).to redirect_to(new_user_session_path) }
        it { expect(flash[:error]).to eq('Could not authenticate you from Google account.') }
      end

      context 'with failing actor when user is signed in' do
        before do
          mock_actor(User::SingleSignOn, result: {}, success: false)
          sign_in create(:user, email:)
          get "/users/auth/#{provider}/callback"
        end

        it { expect(response).to redirect_to(root_path) }
      end

      context 'with invalid credentials' do
        before do
          OmniAuth.config.mock_auth[provider] = :invalid_credentials
          OmniAuth.config.logger = Logger.new('/dev/null')
          Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[provider]
          get "/users/auth/#{provider}/callback"
        end

        it { expect(response).to redirect_to(new_user_session_path) }
      end
    end
  end
end
