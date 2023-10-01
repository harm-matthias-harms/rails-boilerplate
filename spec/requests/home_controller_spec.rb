# frozen_string_literal: true

RSpec.describe HomeController do
  it { expect(described_class.ancestors).to include(ApplicationController) }

  describe '.index' do
    before { get root_path }

    it { expect(response).to have_http_status(:success) }
  end

  describe '.imprint' do
    before { get imprint_path }

    it { expect(response).to have_http_status(:success) }
  end

  describe '.privacy_policy' do
    before { get privacy_policy_path }

    it { expect(response).to have_http_status(:success) }
  end

  describe '.terms_of_service' do
    before { get terms_of_service_path }

    it { expect(response).to have_http_status(:success) }
  end
end
