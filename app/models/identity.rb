# frozen_string_literal: true

class Identity < ApplicationRecord
  belongs_to :user

  validates :provider, :uid, presence: true
  validates :provider, uniqueness: { scope: :uid }
  validates :provider, uniqueness: { scope: :user_id }
  validates :provider, inclusion: { in: Settings.sso.keys.map(&:to_s) }
end

# ## Schema Information
#
# Table name: `identities`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `uuid`             | `not null, primary key`
# **`provider`**    | `string`           | `not null`
# **`uid`**         | `string`           | `not null`
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
# **`user_id`**     | `uuid`             | `not null`
#
# ### Indexes
#
# * `index_identities_on_provider_and_uid` (_unique_):
#     * **`provider`**
#     * **`uid`**
# * `index_identities_on_provider_and_user_id` (_unique_):
#     * **`provider`**
#     * **`user_id`**
# * `index_identities_on_user_id`:
#     * **`user_id`**
#
# ### Foreign Keys
#
# * `fk_rails_...` (_ON DELETE => cascade_):
#     * **`user_id => users.id`**
#
