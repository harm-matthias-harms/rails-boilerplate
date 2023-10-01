# frozen_string_literal: true

RSpec.describe ErrorsController do
  describe '.not_found' do
    before { get '/404' }

    it { expect(response).to have_http_status(:not_found) }

    context 'with other format' do
      before { get '/404.json' }

      it { expect(response).to have_http_status(:not_found) }
    end
  end

  describe '.internal_server_error' do
    before { get '/500' }

    it { expect(response).to have_http_status(:internal_server_error) }

    context 'with other format' do
      before { get '/500.json' }

      it { expect(response).to have_http_status(:internal_server_error) }
    end
  end
end
