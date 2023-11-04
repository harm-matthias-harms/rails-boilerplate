# frozen_string_literal: true

RSpec.describe ApplicationComponent, type: :component do
  subject(:component) { described_class.new(foo: 'bar') }

  describe '.initialize' do
    it { expect(component.instance_variable_get(:@foo)).to eq('bar') }
  end
end
