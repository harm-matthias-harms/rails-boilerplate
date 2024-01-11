# frozen_string_literal: true

RSpec.describe Common::ShowcaseComponent, type: :component do
  subject(:showcase_component) { described_class.new }

  describe '.render' do
    subject do
      render_inline(showcase_component) do |showcase|
        showcase.with_heading { 'Heading' }
        showcase.with_description { 'Description' }
        showcase.with_image(src: 'https://picsum.photos/200/300', alt: 'Image')
        showcase.with_list do |list|
          list.with_item { 'Item 1' }
          list.with_item { 'Item 2' }
          list.with_item { 'Item 3' }
        end
      end
    end

    it { is_expected.to have_css('.hero .hero-content') }
    it { is_expected.to have_css('h2', text: 'Heading') }
    it { is_expected.to have_css('p', text: 'Description') }
    it { is_expected.to have_css('img[src="https://picsum.photos/200/300"][alt="Image"]') }
    it { is_expected.to have_css('ul li', count: 3) }

    context 'with block instead of image' do
      subject do
        render_inline(showcase_component) do |showcase|
          showcase.with_image(src: 'https://picsum.photos/200/300', alt: 'Image') do
            'This is a block instead of an image.'
          end
        end
      end

      it { is_expected.to have_text('This is a block instead of an image.') }
      it { is_expected.to have_no_css('img') }
    end
  end
end
