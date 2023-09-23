# frozen_string_literal: true

RSpec.describe Layout::NotificationComponent, type: :component do
  subject(:notification) { described_class.new(message: 'Model saved', type: :success) }

  it 'renders' do
    render_inline(notification)

    expect(page).to have_css('.alert.alert-success')
  end

  describe 'type' do
    it { expect(notification.type).to eq('alert-success') }

    context 'when type is info' do
      subject(:notification) { described_class.new(message: 'Model saved', type: :info) }

      it { expect(notification.type).to eq('alert-info') }
    end

    context 'when type is error' do
      subject(:notification) { described_class.new(message: 'Model saved', type: :error) }

      it { expect(notification.type).to eq('alert-error') }
    end
  end

  describe 'icon' do
    it { expect(notification.icon).to eq('fa-check-circle') }

    context 'when type is info' do
      subject(:notification) { described_class.new(message: 'Model saved', type: :info) }

      it { expect(notification.icon).to eq('fa-info-circle') }
    end

    context 'when type is error' do
      subject(:notification) { described_class.new(message: 'Model saved', type: :error) }

      it { expect(notification.icon).to eq('fa-exclamation-circle') }
    end
  end

  describe 'timeout' do
    it { expect(notification.timeout).to eq(10_000) }

    context 'when type is info' do
      subject(:notification) { described_class.new(message: 'Model saved', type: :info) }

      it { expect(notification.timeout).to eq(10_000) }
    end

    context 'when type is error' do
      subject(:notification) { described_class.new(message: 'Model saved', type: :error) }

      it { expect(notification.timeout).to eq(20_000) }
    end
  end
end
