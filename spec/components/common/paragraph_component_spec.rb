# frozen_string_literal: true

RSpec.describe Common::ParagraphComponent, type: :component do
  describe '.render' do
    subject { render_inline(described_class.new) { 'Foo' } }

    it { is_expected.to have_css('p.text-base-content.mb-4', text: 'Foo') }
  end
end
