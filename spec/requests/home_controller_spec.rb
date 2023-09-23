# frozen_string_literal: true

RSpec.describe HomeController do
  it { expect(described_class.ancestors).to include(ApplicationController) }

  describe '.index' do
    it 'returns http success' do
      get root_path

      expect(response).to have_http_status(:success)
    end
  end

  describe '.imprint' do
    it 'returns http success' do
      get imprint_path

      expect(response).to have_http_status(:success)
    end
  end

  describe '.privacy_policy' do
    it 'returns http success' do
      get privacy_policy_path

      expect(response).to have_http_status(:success)
    end
  end

  describe '.terms_of_service' do
    it 'returns http success' do
      get terms_of_service_path

      expect(response).to have_http_status(:success)
    end
  end
end
