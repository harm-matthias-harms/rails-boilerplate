# frozen_string_literal: true

RSpec.describe Consent do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:consent) }
    it { is_expected.to validate_presence_of(:ip) }
    it { is_expected.to validate_presence_of(:type) }
    it { is_expected.to validate_presence_of(:useragent) }
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
