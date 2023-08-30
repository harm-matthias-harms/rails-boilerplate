# frozen_string_literal: true

RSpec.describe Common::DropdownComponent, type: :component do
  subject(:dropdown) { described_class.new }

  it 'renders the dropdown label' do
    render_inline(dropdown) do |dropdown|
      dropdown.with_label(button: :ghost) { 'Dropdown' }
    end

    expect(page).to have_link('Dropdown', href: 'javascript:;', class: 'btn btn-ghost')
  end

  it 'renders the dropdown entries' do
    render_inline(dropdown) do |dropdown|
      3.times { dropdown.with_entry(href: '#') { 'Entry' } }
    end

    expect(page).to have_selector('.dropdown-content li a[href="#"]', text: 'Entry', count: 3)
  end

  describe '.align_class' do
    {
      nil => nil,
      :start => nil,
      :end => 'dropdown-end'
    }.each do |align, expected_class|
      it "returns #{expected_class.inspect} for #{align.inspect}" do
        expect(described_class.new(align:).align_class).to eq(expected_class)
      end
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
      it "returns #{expected_class.inspect} for #{direction.inspect}" do
        expect(described_class.new(direction:).direction_class).to eq(expected_class)
      end
    end
  end
end
