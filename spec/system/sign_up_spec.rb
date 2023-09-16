# frozen_string_literal: true

RSpec.describe 'Sign up' do
  let(:user) { build(:user) }

  before do
    visit root_path
    click_link 'Sign up'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_button 'Sign up'
  end

  it 'shows welcome message' do
    expect(page).to have_content 'A message with a confirmation link has been sent to your email address.'
  end

  it 'sends confirmation email' do
    expect(last_email).to be_present
  end

  it 'sends confirmation email to correct email' do
    expect(last_email.to).to include user.email
  end

  it 'sends confirmation email with correct subject' do
    expect(last_email.subject).to eq 'Confirmation instructions'
  end

  it 'sends confirmation email with correct link' do
    expect(last_email_link('confirmation_token')).to be_present
  end
end
