# frozen_string_literal: true

module MailerMacros
  def last_email
    deliveries.last || raise('No email has been sent!')
  end

  def last_email_body_parts
    last_email.body.parts
  end

  def last_email_html_body
    last_email_body_parts.detect { |part| part.content_type.include?('text/html') }&.body&.raw_source
  end

  def last_email_text_body
    last_email_body_parts.detect { |part| part.content_type.include?('text/plain') }&.body&.raw_source
  end

  def last_email_urls
    raw = last_email_html_body.to_s + last_email_text_body.to_s
    URI.extract(raw, %w[http https]).uniq
  end

  def last_email_url(search_str)
    last_email_urls.detect { |url| url.include?(search_str) }
  end

  def last_email_link(search_str)
    url = URI.parse last_email_url(search_str)
    [url.path, url.query].join('?')
  rescue StandardError
    nil
  end

  def reset_email
    mailer.deliveries = []
  end

  protected

  def mailer
    ActionMailer::Base
  end

  def deliveries
    mailer.deliveries
  end
end

RSpec.configure do |config|
  config.include MailerMacros
  config.before { reset_email }
end
