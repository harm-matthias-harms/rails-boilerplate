# frozen_string_literal: true

RSpec.describe Common::ListComponent, type: :component do
  subject(:list_component) { described_class.new }

  describe '.render' do
    subject do
      render_inline(list_component) do |list|
        list.with_item { 'Item' }
        list.with_item { 'Item' }
        list.with_item { 'Item' }
      end
    end

    it { is_expected.to have_css('ul.list-disc') }
    it { is_expected.to have_css('li', text: 'Item', count: 3) }

    context 'when icon is :checkmark' do
      subject do
        render_inline(described_class.new(icon: :checkmark)) do |list|
          list.with_item { 'Item' }
          list.with_item { 'Item' }
          list.with_item { 'Item' }
        end
      end

      it { is_expected.to have_no_css('ul.list-disc') }
      it { is_expected.to have_css('li', text: 'Item', count: 3) }
      it { is_expected.to have_css('li > i.fas.fa-check', count: 3) }
    end
  end
end
