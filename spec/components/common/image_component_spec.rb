# frozen_string_literal: true

RSpec.describe Common::ImageComponent, type: :component do
  subject(:image_component) { described_class.new(src: 'https://example.com/image.png', alt: 'Foo', width: 100, height: 100) }

  describe '.render' do
    subject { render_inline(image_component) }

    it { is_expected.to have_css('img[src="https://example.com/image.png"][alt="Foo"][width="100"][height="100"]') }
  end
end
