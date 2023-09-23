# frozen_string_literal: true

require 'digest'
require 'redcarpet'

class MarkdownRenderer < Redcarpet::Render::HTML
  def autolink(link, link_type)
    return "<a href=\"mailto:#{link}\">#{link}</a>" if link_type == :email
    return "<a href=\"#{link}\">#{link}</a>" if link.starts_with?('/')

    "<a target=\"_blank\" rel=\"noopener noreferrer\" href=\"#{link}\">#{link}</a>"
  end
end

class MarkdownTemplate
  EXTENSIONS = { autolink: true, no_intra_emphasis: true, fenced_code_blocks: true, space_after_headers: true,
                 prettify: true, tables: true }.freeze
  RENDER_OPTIONS = { with_toc_data: true }.freeze

  def call(template, _source)
    renderer = MarkdownRenderer.new(RENDER_OPTIONS)

    <<-EORUBY
    render_component(Common::ContainerComponent, classes: 'my-10') do
      content_tag(:article, class: 'prose') do
        #{Redcarpet::Markdown.new(renderer, EXTENSIONS).render(template.source).inspect}.html_safe
      end
    end
    EORUBY
  end
end

ActionView::Template.register_template_handler(:md, MarkdownTemplate.new)
