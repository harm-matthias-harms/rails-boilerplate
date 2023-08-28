# frozen_string_literal: true

RSpec.describe Common::LinkComponent, type: :component do
  subject(:link) { described_class.new(type: :link, href: '#') }

  let(:button) { described_class.new(type: :button, href: '#', classes: 'btn-primary', data: { turbo: false }) }

  it 'renders a link' do
    render_inline(link) { 'Link' }

    expect(page).to have_link('Link', href: '#')
  end

  it 'renders additional classes' do
    render_inline(button) { 'Button' }

    expect(page).to have_selector('a.btn.btn-primary[data-turbo="false"]', text: 'Button')
  end

  describe '.type_classes' do
    {
      link: 'link link-hover link-primary',
      button: 'btn'
    }.each do |type, classes|
      it "returns #{classes} for type #{type}" do
        expect(described_class.new(type:, href: '#').type_classes).to eq(classes)
      end
    end
  end
end
