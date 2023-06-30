# frozen_string_literal: true

RSpec.describe Mailer::TextComponent, type: :component do
  subject(:text) { described_class.new }

  it 'renders' do
    render_inline(text) { 'Test' }

    expect(page).to have_text('Test')
  end

  describe '.color' do
    it 'defaults to #394E6A' do
      expect(text.color).to eq('#394E6A')
    end

    it 'return #057AFF for primary' do
      text = described_class.new(color: :primary)

      expect(text.color).to eq('#057AFF')
    end

    it 'return #C7C9D1 for gray' do
      text = described_class.new(color: :gray)

      expect(text.color).to eq('#C7C9D1')
    end
  end

  describe '.font_size' do
    it 'defaults to 16px' do
      expect(text.font_size).to eq('16px')
    end

    it 'is overridable' do
      text = described_class.new(font_size: '14px')

      expect(text.font_size).to eq('14px')
    end
  end

  describe '.font_weight' do
    it 'defaults to normal' do
      expect(text.font_weight).to eq('normal')
    end

    it 'is overridable' do
      text = described_class.new(font_weight: 'bold')

      expect(text.font_weight).to eq('bold')
    end
  end

  describe '.font_style' do
    it 'defaults to normal' do
      expect(text.font_style).to eq('normal')
    end

    it 'is overridable' do
      text = described_class.new(font_style: 'italic')

      expect(text.font_style).to eq('italic')
    end
  end

  describe '.text_align' do
    it 'defaults to left' do
      expect(text.text_align).to eq('left')
    end

    it 'is overridable' do
      text = described_class.new(text_align: 'center')

      expect(text.text_align).to eq('center')
    end
  end

  describe '.padding_bottom' do
    it 'defaults to 10px' do
      expect(text.padding_bottom).to eq('10px')
    end

    it 'is overridable' do
      text = described_class.new(padding_bottom: '20px')

      expect(text.padding_bottom).to eq('20px')
    end
  end
end
