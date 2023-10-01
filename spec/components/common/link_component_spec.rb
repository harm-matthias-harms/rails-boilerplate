# frozen_string_literal: true

RSpec.describe Common::LinkComponent, type: :component do
  subject(:link) { described_class.new(link: true, href: '#') }

  let(:button) { described_class.new(button: true, href: '#') }
  let(:link_with_data) { described_class.new(link: true, href: '#', data: { test: 'test' }) }
  let(:link_without_href) { described_class.new(link: true) }

  it 'renders a link' do
    render_inline(link) { 'Link' }

    expect(page).to have_link('Link', href: '#')
  end

  it 'renders button' do
    render_inline(button) { 'Button' }

    expect(page).to have_css('a.btn', text: 'Button')
  end

  it 'renders link with data' do
    render_inline(link_with_data) { 'Link' }

    expect(page).to have_css('a[data-test="test"]')
  end

  it 'renders link without href' do
    render_inline(link_without_href) { 'Link' }

    expect(page).to have_link('Link', href: 'javascript:;')
  end

  describe '.type' do
    it 'returns link' do
      expect(link.type).to eq(:link)
    end

    it 'returns button' do
      expect(button.type).to eq(:button)
    end
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
      ghost: 'btn-ghost',
      block: 'btn-block',
      random: nil
    }.each do |button, classes|
      it "returns #{classes} for button #{button}" do
        expect(described_class.new(button:, href: '#').button_class).to eq(classes)
      end
    end
  end
end
