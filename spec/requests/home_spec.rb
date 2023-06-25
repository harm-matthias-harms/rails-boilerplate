# frozen_string_literal: true

RSpec.describe 'Homes' do
  describe '.index' do
    it 'returns http success' do
      get root_path

      expect(response).to have_http_status(:success)
    end
  end
end
