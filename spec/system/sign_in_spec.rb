# frozen_string_literal: true

RSpec.describe 'Sign in' do
  let(:user) { create(:user) }

  before do
    visit root_path
    click_link_or_button 'Log in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_link_or_button 'Log in'
  end

  it { expect(page).to have_content 'Signed in successfully.' }
  it { expect(page).to have_link 'Sign out' }
end
