# frozen_string_literal: true

class Consent < ApplicationRecord
  belongs_to :user

  validates :consent, :ip, :type, :user_agent, presence: true
  validates :accepted, inclusion: { in: [true] }
end

class Consent::PrivacyTos < Consent
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
# * `fk_rails_...` (_ON DELETE => cascade_):
#     * **`user_id => users.id`**
#
