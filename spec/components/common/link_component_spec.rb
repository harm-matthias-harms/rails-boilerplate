# frozen_string_literal: true

RSpec.describe Common::LinkComponent, type: :component do
  subject(:link) { described_class.new(link: true, href: '#') }

  let(:button) { described_class.new(button: true, href: '#') }

  describe '.render' do
    subject { render_inline(link) { 'Link' } }

    it { is_expected.to have_link('Link', href: '#') }

    context 'when button' do
      subject { render_inline(button) { 'Button' } }

      it { is_expected.to have_css('a.btn', text: 'Button') }
    end

    context 'when link with data' do
      subject { render_inline(link_with_data) { 'Link' } }

      let(:link_with_data) { described_class.new(link: true, href: '#', data: { test: 'test' }) }

      it { is_expected.to have_css('a[data-test="test"]') }
    end

    context 'when link without href' do
      subject { render_inline(link_without_href) { 'Link' } }

      let(:link_without_href) { described_class.new(link: true) }

      it { is_expected.to have_link('Link', href: 'javascript:;') }
    end
  end

  describe '.type' do
    it { expect(link.type).to eq(:link) }
    it { expect(button.type).to eq(:button) }
  end

  describe '.type_classes' do
    {
      link: 'link link-hover link-primary',
      button: 'btn'
    }.each do |type, classes|
      it { expect(described_class.new(type => true, href: '#').type_classes).to eq(classes) }
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
      it { expect(described_class.new(button:, href: '#').button_class).to eq(classes) }
    end
  end
end
