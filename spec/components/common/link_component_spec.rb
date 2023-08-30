# frozen_string_literal: true

RSpec.describe Common::LinkComponent, type: :component do
  subject(:link) { described_class.new(link: true, href: '#') }

  let(:button) { described_class.new(button: true, href: '#') }
  let(:link_with_data) { described_class.new(link: true, href: '#', data: { test: 'test' }) }

  it 'renders a link' do
    render_inline(link) { 'Link' }

    expect(page).to have_link('Link', href: '#')
  end

  it 'renders button' do
    render_inline(button) { 'Button' }

    expect(page).to have_selector('a.btn', text: 'Button')
  end

  it 'renders link with data' do
    render_inline(link_with_data) { 'Link' }

    expect(page).to have_selector('a[data-test="test"]')
  end

  describe '.type_classes' do
    {
      link: 'link link-hover link-primary',
      button: 'btn'
    }.each do |type, classes|
      it "returns #{classes} for type #{type}" do
        expect(described_class.new(type => true, href: '#').type_classes).to eq(classes)
      end
    end
  end

  describe '.button_class' do
    {
      nil => nil,
      true => nil,
      primary: 'btn-primary',
      ghost: 'btn-ghost'
    }.each do |button, classes|
      it "returns #{classes} for button #{button}" do
        expect(described_class.new(button:, href: '#').button_class).to eq(classes)
      end
    end
  end
end
