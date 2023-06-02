module ViewComponentsHelper

  def render_component(klass, *args, **kwargs, &block)
    if public_methods.include? :view_context
      klass.new(*args, **kwargs).render_in(view_context)
    elsif public_methods.include? :render
      render(klass.new(*args, **kwargs), &block)
    end
  end

  def render_component_collection(klass, *args, **kwargs, &block)
    if public_methods.include? :view_context
      klass.with_collection(*args, **kwargs).render_in(view_context)
    elsif public_methods.include? :render
      render(klass.with_collection(*args, **kwargs, &block))
    end
  end
end
