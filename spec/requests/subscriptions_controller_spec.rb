# frozen_string_literal: true

RSpec.describe SubscriptionsController do
  describe 'GET /new' do
    it 'returns http success' do
      get '/subscription/new'
      expect(response).to have_http_status(:success)
    end
  end
end
