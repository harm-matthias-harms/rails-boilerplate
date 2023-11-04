# frozen_string_literal: true

RSpec.describe Mailer::ButtonComponent, type: :component do
  subject(:button) { described_class.new(href: '/test', text: 'test') }

  describe '.render' do
    subject { render_inline(button) { 'test' } }

    it { is_expected.to have_link('test', href: '/test') }
  end
end
