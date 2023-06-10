# frozen_string_literal: true

class ActorJob < ApplicationJob
  queue_as :default

  def perform(actor_class, result)
    actor_class.call(result)
  end
end
