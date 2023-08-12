# frozen_string_literal: true

RSpec.describe Layout::FooterComponent, type: :component do
  subject { render_inline(described_class.new) }

  it { is_expected.to have_css('.bg-base-200 >.container > footer.footer') }
  it { is_expected.to have_text('Copyright © 2023 - All right reserved') }
end
