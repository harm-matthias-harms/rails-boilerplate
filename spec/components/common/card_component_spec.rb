# frozen_string_literal: true

RSpec.describe Common::CardComponent, type: :component do
  subject(:card_component) { described_class.new(classes: 'foo') }

  describe '.render' do
    subject do
      render_inline(card_component) do |card|
        card.with_heading { 'Heading' }
        card.with_list do |list|
          list.with_item { 'Item 1' }
          list.with_item { 'Item 2' }
        end
        card.with_action { 'Action' }
        'Content'
      end
    end

    it { is_expected.to have_css('.card.foo') }
    it { is_expected.to have_css('.card .card-body', text: 'Content') }
    it { is_expected.to have_css('.card h3', text: 'Heading') }
    it { is_expected.to have_css('.card li', count: 2) }
    it { is_expected.to have_css('.card .card-actions .btn.btn-primary.btn-wide', text: 'Action') }
  end
end
