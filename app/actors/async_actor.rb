class AsyncActor < ApplicationActor
  class << self
    attr_accessor :target_actor
  end

  def call
    ActorJob.perform_later(self.class.target_actor, result.dup)
  end
end
