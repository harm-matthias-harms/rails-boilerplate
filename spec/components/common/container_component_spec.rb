# frozen_string_literal: true

RSpec.describe Common::ContainerComponent, type: :component do
  describe '.render' do
    subject { render_inline(described_class.new) }

    it { is_expected.to have_css('.container.m-10') }

    context 'when margin is set' do
      subject { render_inline(described_class.new(margin: 'm-20')) }

      it { is_expected.to have_css('.container.m-20') }
    end
  end
end
