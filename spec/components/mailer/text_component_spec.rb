# frozen_string_literal: true

RSpec.describe Mailer::TextComponent, type: :component do
  subject(:text) { described_class.new }

  describe '.render' do
    subject { render_inline(text) { 'test' } }

    it { is_expected.to have_text('test') }
  end

  describe '.color' do
    it { expect(text.color).to eq('#394E6A') }

    context 'when color is primary' do
      subject(:text) { described_class.new(color: :primary) }

      it { expect(text.color).to eq('#057AFF') }
    end

    context 'when color is gray' do
      subject(:text) { described_class.new(color: :gray) }

      it { expect(text.color).to eq('#C7C9D1') }
    end
  end

  describe '.font_size' do
    it { expect(text.font_size).to eq('16px') }

    context 'with custom font size' do
      subject(:text) { described_class.new(font_size: '14px') }

      it { expect(text.font_size).to eq('14px') }
    end
  end

  describe '.font_weight' do
    it { expect(text.font_weight).to eq('normal') }

    context 'with custom font weight' do
      subject(:text) { described_class.new(font_weight: 'bold') }

      it { expect(text.font_weight).to eq('bold') }
    end
  end

  describe '.font_style' do
    it { expect(text.font_style).to eq('normal') }

    context 'with custom font style' do
      subject(:text) { described_class.new(font_style: 'italic') }

      it { expect(text.font_style).to eq('italic') }
    end
  end

  describe '.text_align' do
    it { expect(text.text_align).to eq('left') }

    context 'with custom text align' do
      subject(:text) { described_class.new(text_align: 'center') }

      it { expect(text.text_align).to eq('center') }
    end
  end

  describe '.padding_bottom' do
    it { expect(text.padding_bottom).to eq('10px') }

    context 'with custom padding bottom' do
      subject(:text) { described_class.new(padding_bottom: '20px') }

      it { expect(text.padding_bottom).to eq('20px') }
    end
  end
end
