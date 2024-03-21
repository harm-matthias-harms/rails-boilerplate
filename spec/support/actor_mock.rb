# frozen_string_literal: true

module ActorMock
  def mock_actor(klass, result: {}, success: true)
    result[:failure] = !success
    actor = ServiceActor::Result.to_result(result)

    allow(klass).to receive(:result).and_return(actor)
  end
end

RSpec.configure do |config|
  config.include ActorMock, type: :request
end
