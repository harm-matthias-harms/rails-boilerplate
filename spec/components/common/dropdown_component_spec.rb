# frozen_string_literal: true

RSpec.describe Common::DropdownComponent, type: :component do
  subject(:dropdown) { described_class.new }

  describe '.render' do
    subject do
      render_inline(dropdown) do |dropdown|
        dropdown.with_label(button: :ghost) { 'Dropdown' }
      end
    end

    it { is_expected.to have_link('Dropdown', href: 'javascript:;', class: 'btn btn-ghost') }
  end

  context 'with multiple entries' do
    subject do
      render_inline(dropdown) do |dropdown|
        3.times { dropdown.with_entry(href: '#') { 'Entry' } }
      end
    end

    it { is_expected.to have_css('.dropdown-content li a[href="#"]', text: 'Entry', count: 3) }
  end

  describe '.align_class' do
    {
      nil => nil,
      :start => nil,
      :end => 'dropdown-end'
    }.each do |align, expected_class|
      it { expect(described_class.new(align:).align_class).to eq(expected_class) }
    end
  end

  describe '.direction_class' do
    {
      nil => 'dropdown-bottom',
      :top => 'dropdown-top',
      :right => 'dropdown-right',
      :left => 'dropdown-left',
      :bottom => 'dropdown-bottom'
    }.each do |direction, expected_class|
      it { expect(described_class.new(direction:).direction_class).to eq(expected_class) }
    end
  end
end
