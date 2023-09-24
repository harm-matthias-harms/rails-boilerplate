# frozen_string_literal: true

RSpec.describe Consent do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:accepted) }
    it { is_expected.to validate_presence_of(:consent) }
    it { is_expected.to validate_presence_of(:ip) }
    it { is_expected.to validate_presence_of(:type) }
    it { is_expected.to validate_presence_of(:user_agent) }
    it { is_expected.to validate_inclusion_of(:accepted).in_array([true]) }
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
