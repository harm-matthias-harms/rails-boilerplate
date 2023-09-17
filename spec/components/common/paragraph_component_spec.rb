# frozen_string_literal: true

RSpec.describe Common::ParagraphComponent, type: :component do
  subject(:paragraph) { described_class.new }

  it 'renders the paragraph' do
    render_inline(paragraph) { 'Foo' }

    expect(page).to have_css('p.text-base-content.mb-2', text: 'Foo')
  end
end
