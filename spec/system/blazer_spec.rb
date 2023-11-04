# frozen_string_literal: true

RSpec.describe Blazer do
  context 'when normal user' do
    before { sign_in create(:user) }

    it { expect { visit blazer_path }.to raise_error ActionController::RoutingError }
  end

  context 'when admin user' do
    before do
      sign_in create(:user, :admin)
      visit blazer_path
    end

    it { expect(page).to have_content 'New Query' }
  end
end
