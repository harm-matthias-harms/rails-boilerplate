# frozen_string_literal: true

RSpec.describe Identity do
  subject(:identity) { build(:identity) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:provider) }
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_inclusion_of(:provider).in_array(Settings.sso.keys) }

    context 'with none unique provider' do
      subject(:identity) { build(:identity, provider: existing_identity.provider) }

      let(:existing_identity) { create(:identity) }

      it 'validates uniqueness of provider scoped to uid' do
        identity.uid = existing_identity.uid

        expect(identity).not_to be_valid
      end

      it 'validates uniqueness of provider scoped to user_id' do
        identity.user_id = existing_identity.user_id

        expect(identity).not_to be_valid
      end
    end
  end
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
