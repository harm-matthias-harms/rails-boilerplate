# frozen_string_literal: true

module ViewComponentsHelper
  def render_component(klass, *args, **kwargs, &)
    render(klass.new(*args, **kwargs), &)
  end

  def render_component_collection(klass, *args, **kwargs, &)
    render(klass.with_collection(*args, **kwargs, &))
  end
end
