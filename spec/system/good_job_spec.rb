# frozen_string_literal: true

RSpec.describe GoodJob do
  context 'when normal user' do
    before { sign_in create(:user) }

    it { expect { visit good_job_path }.to raise_error ActionController::RoutingError }
  end

  context 'when admin user' do
    before { sign_in create(:user, :admin) }

    it 'shows good_job dashboard' do
      visit good_job_path

      expect(page).to have_content 'GoodJob'
    end
  end
end
