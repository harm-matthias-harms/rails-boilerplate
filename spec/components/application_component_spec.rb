# frozen_string_literal: true

RSpec.describe ApplicationComponent, type: :component do
  it 'sets kwargs' do
    component = described_class.new(foo: 'bar')

    expect(component.instance_variable_get(:@foo)).to eq('bar')
  end
end
