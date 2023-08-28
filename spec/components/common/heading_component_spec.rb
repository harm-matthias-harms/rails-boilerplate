# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Common::HeadingComponent, type: :component do
  subject(:heading) { described_class.new(tag: :h1) }

  it 'renders the heading' do
    render_inline(heading) { 'Hello, World!' }

    expect(page).to have_css('h1.text-4xl.text-primary.mb-4', text: 'Hello, World!')
  end

  describe '.size' do
    {
      h1: 'text-4xl',
      h2: 'text-3xl',
      h3: 'text-2xl',
      h4: 'text-xl font-bold',
      h5: 'text-lg font-bold',
      h6: 'text-base font-bold'
    }.each do |tag, size|
      it "returns #{size} for #{tag}" do
        heading = described_class.new(tag:)

        expect(heading.size).to eq(size)
      end
    end
  end

  describe '.color' do
    {
      h1: 'text-primary',
      h2: 'text-secondary',
      h3: 'text-secondary',
      h4: 'text-base-content',
      h5: 'text-base-content',
      h6: 'text-base-content'
    }.each do |tag, color|
      it "returns #{color} for #{tag}" do
        heading = described_class.new(tag:)

        expect(heading.color).to eq(color)
      end
    end
  end

  describe '.margin' do
    {
      h1: 'mb-4',
      h2: 'mb-4',
      h3: 'mb-4',
      h4: 'mb-4',
      h5: 'mb-2',
      h6: 'mb-2'
    }.each do |tag, margin|
      it "returns #{margin} for #{tag}" do
        heading = described_class.new(tag:)

        expect(heading.margin).to eq(margin)
      end
    end
  end
end
