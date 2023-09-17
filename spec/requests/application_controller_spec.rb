# frozen_string_literal: true

class MockedController < ApplicationController
  def unknown_format
    raise ActionController::UnknownFormat
  end

  def cookie_overflow
    raise ActionDispatch::Cookies::CookieOverflow
  end
end

RSpec.describe ApplicationController do
  it { expect(described_class.ancestors).to include(Flashable) }
  it { expect(described_class.ancestors).to include(Pundit::Authorization) }

  describe 'rescues from' do
    before do
      Rails.application.routes.draw do
        get '/unknown_format' => 'mocked#unknown_format'
        get '/cookie_overflow' => 'mocked#cookie_overflow'
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
  end
end
