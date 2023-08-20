# frozen_string_literal: true

class DeviseMailerPreview < ActionMailer::Preview
  # Accessible from http://localhost:3000/rails/mailers/devise_mailer/confirmation_instructions
  def confirmation_instructions
    Devise::Mailer.confirmation_instructions(User.new(email: 'foo.bar@example.com'), 'faketoken')
  end

  # Accessible from http://localhost:3000/rails/mailers/devise_mailer/reset_password_instructions
  def reset_password_instructions
    Devise::Mailer.reset_password_instructions(User.new(email: 'foo.bar@example.com'), 'faketoken')
  end

  # Accessible from http://localhost:3000/rails/mailers/devise_mailer/password_change
  def password_change
    Devise::Mailer.password_change(User.new(email: 'foo.bar@example.com'))
  end

  # Accessible from http://localhost:3000/rails/mailers/devise_mailer/email_changed
  def email_changed
    Devise::Mailer.email_changed(User.new(email: 'foo.bar@example.com'))
  end
end
