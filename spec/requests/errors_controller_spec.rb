# frozen_string_literal: true

RSpec.describe ErrorsController do
  describe 'GET /404' do
    it 'returns http not found' do
      get '/404'

      expect(response).to have_http_status(:not_found)
    end

    it 'returns http not found for any format' do
      get '/404.json'

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET /500' do
    it 'returns http internal server error' do
      get '/500'

      expect(response).to have_http_status(:internal_server_error)
    end

    it 'returns http internal server error for any format' do
      get '/500.json'

      expect(response).to have_http_status(:internal_server_error)
    end
  end
end
