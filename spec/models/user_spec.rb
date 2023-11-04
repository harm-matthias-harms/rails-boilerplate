# frozen_string_literal: true

RSpec.describe User do
  subject(:user) { build(:user) }

  describe 'associations' do
    it { is_expected.to have_many(:consents).dependent(:delete_all) }
    it { is_expected.to have_many(:ahoy_visits).dependent(:destroy) }
    it { is_expected.to accept_nested_attributes_for(:consents) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:encrypted_password) }
    it { is_expected.to validate_presence_of(:sign_in_count) }
    it { is_expected.to validate_uniqueness_of(:confirmation_token).allow_nil }
    it { is_expected.to validate_uniqueness_of(:reset_password_token).allow_nil }

    it 'validates disposable email', :validate_email do
      expect(build(:user, email: 'mena.augustus@dabrapids.com')).not_to be_valid
    end
  end

  describe '.to_s' do
    it { expect(user.to_s).to eq user.email }
  end
end

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
# **`confirmation_token`**      | `string`           |
# **`confirmed_at`**            | `datetime`         |
# **`current_sign_in_at`**      | `datetime`         |
# **`current_sign_in_ip`**      | `string`           |
# **`email`**                   | `string`           | `default(""), not null`
# **`encrypted_password`**      | `string`           | `default(""), not null`
# **`last_sign_in_at`**         | `datetime`         |
# **`last_sign_in_ip`**         | `string`           |
# **`remember_created_at`**     | `datetime`         |
# **`reset_password_sent_at`**  | `datetime`         |
# **`reset_password_token`**    | `string`           |
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
