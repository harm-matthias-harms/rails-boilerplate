# frozen_string_literal: true

RSpec.describe Common::ImageComponent, type: :component do
  subject(:image_component) { described_class.new(src: 'https://example.com/image.png', alt: 'Foo', width: 100, height: 100) }

  describe '.render' do
    subject { render_inline(image_component) }

    it { is_expected.to have_css('img.rounded-lg[src="https://example.com/image.png"][alt="Foo"][width="100"][height="100"]') }

    context 'when shadow is true' do
      subject { render_inline(described_class.new(shadow: true, src: 'https://example.com/image.png')) }

      it { is_expected.to have_css('img.rounded-lg.shadow-2xl[src="https://example.com/image.png"]') }
    end
  end
end
