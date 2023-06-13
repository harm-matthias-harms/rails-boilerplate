# frozen_string_literal: true

class AsyncActor < ApplicationActor
  class_attribute :target_actor

  def call
    ActorJob.perform_later(self.class.target_actor, result.dup)
  end
end
