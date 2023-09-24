# frozen_string_literal: true

FactoryBot.define do
  factory :consent_privacy_tos, class: 'Consent::PrivacyTos' do
    user
    accepted { true }
    consent { 'Consent checkbox description' }
    ip { '127.0.0.1' }
    user_agent { 'Mozilla/5.0' }
  end
end

# ## Schema Information
#
# Table name: `consents`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `uuid`             | `not null, primary key`
# **`accepted`**    | `boolean`          | `default(FALSE), not null`
# **`consent`**     | `text`             | `not null`
# **`ip`**          | `inet`             | `not null`
# **`type`**        | `text`             | `not null`
# **`user_agent`**  | `text`             | `not null`
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
# **`user_id`**     | `uuid`             | `not null`
#
# ### Indexes
#
# * `index_consents_on_user_id`:
#     * **`user_id`**
#
# ### Foreign Keys
#
# * `fk_rails_...`:
#     * **`user_id => users.id`**
#
