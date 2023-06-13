# frozen_string_literal: true

module ActorMock
  def mock_actor(klass, result: {}, success: true)
    actor = ServiceActor::Result.to_result(result)

    allow(klass).to receive(:result).and_return(actor)
    allow(actor).to receive(:success?).and_return(success)
  end
end

RSpec.configure do |config|
  config.include ActorMock, type: :request
end
