# frozen_string_literal: true

RSpec.describe 'Sign in' do
  let(:user) { create(:user) }

  before do
    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end

  it 'shows welcome message' do
    expect(page).to have_content 'Signed in successfully.'
  end

  it 'shows sign out link' do
    expect(page).to have_link 'Sign out'
  end
end
