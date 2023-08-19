# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  helper ViewComponentsHelper

  layout 'mailer'

  default from: Settings.mail.sender, reply_to: Settings.mail.support

  private

  def process_action(*args)
    Current.user = args.detect { |arg| arg.is_a? User }
    super
  end
end
