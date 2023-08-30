# frozen_string_literal: true

RSpec.describe Layout::NavbarComponent, type: :component do
  subject { render_inline(described_class.new) }

  it { is_expected.to have_css('nav.navbar.sticky.backdrop-blur.bg-opacity-90') }
  it { is_expected.to have_link(href: root_path) }
  it { is_expected.to have_link(href: new_user_session_path) }
  it { is_expected.to have_link(href: new_user_registration_path) }

  context 'when user is signed in' do
    before do
      Current.user = build(:user)
    end

    it { is_expected.to have_link(href: edit_user_registration_path) }
    it { is_expected.to have_link(href: destroy_user_session_path) }
  end
end
