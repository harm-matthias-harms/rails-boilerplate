# frozen_string_literal: true

RSpec.describe Common::CardComponent, type: :component do
  subject(:card_component) { described_class.new(classes: 'foo') }

  describe '.render' do
    subject { render_inline(card_component) { 'Content' } }

    it { is_expected.to have_css('.card.foo') }
    it { is_expected.to have_css('.card .card-body', text: 'Content') }
  end
end
