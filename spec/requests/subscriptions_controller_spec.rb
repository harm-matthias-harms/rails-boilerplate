# frozen_string_literal: true

RSpec.describe SubscriptionsController do
  describe 'GET /index' do
    it 'returns http success' do
      get '/subscriptions'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/subscriptions/new'
      expect(response).to have_http_status(:success)
    end
  end
end
