# frozen_string_literal: true

RSpec.describe ActorJob do
  subject(:job) { described_class.new }

  describe '.perform' do
    it 'calls actor class' do
      actor = ApplicationActor.new({})

      expect(actor).to receive(:call).with({})

      job.perform(actor, {})
    end
  end
end
