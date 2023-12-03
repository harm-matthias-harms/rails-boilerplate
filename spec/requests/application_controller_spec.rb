# frozen_string_literal: true

class MockedController < ApplicationController
  def unknown_format
    raise ActionController::UnknownFormat
  end

  def cookie_overflow
    raise ActionDispatch::Cookies::CookieOverflow
  end

  def unauthorized
    raise Pundit::NotAuthorizedError
  end

  def random_action
    skip_authorization
    head :ok
  end

  def create
    skip_authorization
    set_flash(:success, model: User)
  end
end

RSpec.describe ApplicationController do
  it { expect(described_class.ancestors).to include(Flashable) }
  it { expect(described_class.ancestors).to include(Deviseable) }
  it { expect(described_class.ancestors).to include(Trackable) }
  it { expect(described_class.ancestors).to include(Pundit::Authorization) }

  describe 'rescues from' do
    before do
      Rails.application.routes.draw do
        root to: 'mocked#random_action'
        devise_for :users

        get '/unknown_format' => 'mocked#unknown_format'
        get '/cookie_overflow' => 'mocked#cookie_overflow'
        get '/unauthorized' => 'mocked#unauthorized'
      end
    end

    after do
      Rails.application.reload_routes!
    end

    it 'rescues from ActionController::UnknownFormat' do
      get '/unknown_format'

      expect(response).to have_http_status(:unsupported_media_type)
    end

    it 'rescues from ActionDispatch::Cookies::CookieOverflow' do
      get '/cookie_overflow'

      expect(response).to have_http_status(:request_header_fields_too_large)
    end

    it 'rescues from Pundit::NotAuthorizedError', :aggregate_failures do
      get '/unauthorized'

      expect(response).to redirect_to(new_user_session_url)
      expect(flash[:alert]).to eq('You need to sign in or sign up before continuing.')
    end

    it 'rescues from Pundit::NotAuthorizedError with current_user', :aggregate_failures do
      sign_in create(:user)
      get '/unauthorized'

      expect(response).to redirect_to(root_url)
      expect(flash[:alert]).to eq('You are not authorized to perform this action.')
    end
  end

  describe Trackable do
    before do
      Ahoy.track_bots = true
      Rails.application.routes.draw do
        get '/random_action' => 'mocked#random_action'
      end
    end

    after do
      Ahoy.track_bots = false
      Rails.application.reload_routes!
    end

    it 'tracks action' do
      expect { get '/random_action' }.to change(Ahoy::Event, :count).by(1)
    end

    it 'tracks visited route' do
      get '/random_action'

      expect(Ahoy::Event.last.properties).to eq({ 'controller' => 'mocked', 'action' => 'random_action',
                                                  'format' => 'text/html' })
    end
  end

  describe Flashable do
    before do
      Rails.application.routes.draw do
        post '/create' => 'mocked#create'
      end
    end

    after { Rails.application.reload_routes! }

    it 'sets flash message' do
      post '/create'

      expect(flash[:success]).to eq('User created successfully.')
    end

    it 'sets flash.now for turbo frame request' do
      post '/create', headers: { 'Turbo-Frame' => 'frame-id' }

      expect(flash.now[:success]).to eq('User created successfully.')
    end
  end
end
