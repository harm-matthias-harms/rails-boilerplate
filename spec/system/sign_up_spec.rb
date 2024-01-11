# frozen_string_literal: true

RSpec.describe 'Sign up' do
  let(:user) { build(:user) }

  before do
    visit root_path
    click_link_or_button 'Sign up'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    check 'I accept the'
    click_link_or_button 'Sign up'
  end

  it 'creates user and shows welcome message', :aggregate_failures, :js do
    expect(page).to have_content 'A message with a confirmation link has been sent to your email address.'
    expect(User.find_by(email: user.email)).to be_present
    expect(User.find_by(email: user.email).consents).to be_present
    expect(User.find_by(email: user.email).consents.first&.consent)
      .to eq(Consent::PrivacyTos.human_attribute_name(:accepted))
  end

  it 'sends confirmation email', :aggregate_failures, :js do
    expect(page).to have_content 'A message with a confirmation link has been sent to your email address.'
    expect(last_email).to be_present
    expect(last_email.to).to include user.email
    expect(last_email.subject).to eq 'Confirmation instructions'
    expect(last_email_link('confirmation_token')).to be_present
  end
end
