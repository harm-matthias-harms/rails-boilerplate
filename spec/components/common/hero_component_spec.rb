# frozen_string_literal: true

RSpec.describe Common::HeroComponent, type: :component do
  subject(:hero_component) { described_class.new }

  describe '.render' do
    subject do
      render_inline(hero_component) do |hero|
        hero.with_heading
        hero.with_paragraph
        hero.with_image
        hero.with_action
        hero.with_action
      end
    end

    before do
      mock_component(Common::HeadingComponent)
      mock_component(Common::ParagraphComponent)
      mock_component(Common::ImageComponent)
      mock_component(Common::LinkComponent)
    end

    it { is_expected.to have_css('div.hero > div.hero-content') }
    it { is_expected.to have_text('Mocked Common::HeadingComponent') }
    it { is_expected.to have_text('Mocked Common::ParagraphComponent') }
    it { is_expected.to have_text('Mocked Common::ImageComponent') }
    it { is_expected.to have_text('Mocked Common::LinkComponent', count: 2) }
  end
end
