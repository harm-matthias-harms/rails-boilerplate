# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable, :confirmable,
         :omniauthable, omniauth_providers: Settings.sso.keys

  pay_customer default_payment_processor: Settings.pay.default_processor

  has_many :consents, dependent: :delete_all
  has_many :identities, dependent: :delete_all
  has_many :ahoy_visits, class_name: 'Ahoy::Visit', dependent: :destroy

  validates :confirmation_token, :reset_password_token, uniqueness: true, allow_nil: true
  validates :encrypted_password, :sign_in_count, presence: true
  validates :email, presence: true, 'valid_email_2/email': { disposable: true }

  enum :role, { user: 0, admin: 1 }, default: :user

  accepts_nested_attributes_for :consents

  def to_s
    email
  end

  private

  def send_devise_notification(notification, *)
    devise_mailer.send(notification, self, *).deliver_later
  end
end

# rubocop:disable Lint/RedundantCopDisableDirective, Layout/LineLength, Style/AsciiComments
# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name                          | Type               | Attributes
# ----------------------------- | ------------------ | ---------------------------
# **`id`**                      | `uuid`             | `not null, primary key`
# **`confirmation_sent_at`**    | `datetime`         |
# **`confirmation_token`**      | `string`           | `indexed`
# **`confirmed_at`**            | `datetime`         |
# **`current_sign_in_at`**      | `datetime`         |
# **`current_sign_in_ip`**      | `string`           |
# **`email`**                   | `string`           | `default(""), not null, indexed`
# **`encrypted_password`**      | `string`           | `default(""), not null`
# **`last_sign_in_at`**         | `datetime`         |
# **`last_sign_in_ip`**         | `string`           |
# **`remember_created_at`**     | `datetime`         |
# **`reset_password_sent_at`**  | `datetime`         |
# **`reset_password_token`**    | `string`           | `indexed`
# **`role`**                    | `integer`          | `default("user")`
# **`sign_in_count`**           | `integer`          | `default(0), not null`
# **`unconfirmed_email`**       | `string`           |
# **`created_at`**              | `datetime`         | `not null`
# **`updated_at`**              | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_users_on_confirmation_token` (_unique_):
#     * **`confirmation_token`**
# * `index_users_on_email` (_unique_):
#     * **`email`**
# * `index_users_on_reset_password_token` (_unique_):
#     * **`reset_password_token`**
#
# rubocop:enable Lint/RedundantCopDisableDirective, Layout/LineLength, Style/AsciiComments
