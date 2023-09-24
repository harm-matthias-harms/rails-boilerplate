# frozen_string_literal: true

class Consent < ApplicationRecord
  belongs_to :user

  validates :consent, :ip, :type, :useragent, presence: true
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
# **`consent`**     | `text`             | `not null`
# **`ip`**          | `inet`             | `not null`
# **`type`**        | `text`             | `not null`
# **`useragent`**   | `text`             | `not null`
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
