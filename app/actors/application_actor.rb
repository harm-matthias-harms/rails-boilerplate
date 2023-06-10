# frozen_string_literal: true

class ApplicationActor < Actor
  fail_on ServiceActor::ArgumentError
end
