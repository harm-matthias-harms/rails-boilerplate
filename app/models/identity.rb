# frozen_string_literal: true

class Identity < ApplicationRecord
  belongs_to :user

  validates :provider, :uid, presence: true
  validates :provider, uniqueness: { scope: :uid }
  validates :provider, uniqueness: { scope: :user_id }
  validates :provider, inclusion: { in: Settings.sso.keys.map(&:to_s) }
end

# rubocop:disable Lint/RedundantCopDisableDirective, Layout/LineLength, Style/AsciiComments
# ## Schema Information
#
# Table name: `identities`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `uuid`             | `not null, primary key`
# **`provider`**    | `string`           | `not null, indexed => [uid], indexed => [user_id]`
# **`uid`**         | `string`           | `not null, indexed => [provider]`
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
# **`user_id`**     | `uuid`             | `not null, indexed => [provider], indexed`
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
# rubocop:enable Lint/RedundantCopDisableDirective, Layout/LineLength, Style/AsciiComments
