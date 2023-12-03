# frozen_string_literal: true

RSpec.describe ApplicationComponent, type: :component do
  subject(:component) { described_class.new(foo: 'bar') }

  describe '.initialize' do
    it { expect(component.instance_variable_get(:@foo)).to eq('bar') }
  end

  describe '.policy' do
    subject { component.policy(record, policy_class:) }

    let(:record) { double }
    let(:policy_class) { nil }

    before { allow(Pundit).to receive(:policy).and_return(:policy) }

    it { is_expected.to eq(:policy) }

    context 'when policy_class is not nil' do
      let(:policy_class) { double }

      before { allow(policy_class).to receive(:new).and_return(:policy_class) }

      it { is_expected.to eq(:policy_class) }
    end
  end
end
