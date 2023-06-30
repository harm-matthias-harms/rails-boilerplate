# frozen_string_literal: true

RSpec.describe Mailer::ButtonComponent, type: :component do
  subject(:button) { described_class.new(href: '/test', text: 'test') }

  it 'renders' do
    render_inline(button) { 'test' }

    expect(page).to have_link('test', href: '/test')
  end
end
