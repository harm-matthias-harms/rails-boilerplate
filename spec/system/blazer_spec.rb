# frozen_string_literal: true

RSpec.describe Blazer do
  context 'when normal user' do
    before { sign_in create(:user) }

    it { expect { visit blazer_path }.to raise_error ActionController::RoutingError }
  end

  context 'when admin user' do
    before { sign_in create(:user, :admin) }

    it 'shows good_job dashboard' do
      visit blazer_path

      expect(page).to have_content 'New Query'
    end
  end
end
