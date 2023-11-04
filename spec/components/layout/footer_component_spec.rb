# frozen_string_literal: true

RSpec.describe Layout::FooterComponent, type: :component do
  describe '.render' do
    subject { render_inline(described_class.new) }

    it { is_expected.to have_css('footer.footer.bg-base-200') }
    it { is_expected.to have_text('© 2023 - All right reserved') }
  end
end
