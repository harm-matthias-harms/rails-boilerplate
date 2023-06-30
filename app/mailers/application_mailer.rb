# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  helper ViewComponentsHelper

  layout 'mailer'

  default from: Settings.mail.sender
end
