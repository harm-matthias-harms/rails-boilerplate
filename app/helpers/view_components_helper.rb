# frozen_string_literal: true

module ViewComponentsHelper
  def render_component(klass, *, **, &)
    render(klass.new(*, **), &)
  end

  def render_component_collection(klass, *, **, &)
    render(klass.with_collection(*, **, &))
  end
end
