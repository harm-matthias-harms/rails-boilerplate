# frozen_string_literal: true

RSpec.describe AsyncActor do
  subject(:actor) { described_class.new({}) }

  describe '.call' do
    it 'calls actor job' do
      expect(ActorJob).to receive(:perform_later)

      actor.call
    end
  end
end
