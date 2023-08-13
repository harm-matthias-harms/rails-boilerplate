# frozen_string_literal: true

RSpec.describe Layout::NavbarComponent, type: :component do
  subject { render_inline(described_class.new) }

  it { is_expected.to have_css('nav.navbar.sticky.backdrop-blur.bg-opacity-90') }
  it { is_expected.to have_link(href: root_path) }
end
