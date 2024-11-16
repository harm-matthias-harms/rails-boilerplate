# frozen_string_literal: true

class Ahoy::Event < ApplicationRecord
  include Ahoy::QueryMethods

  self.table_name = 'ahoy_events'
  self.implicit_order_column = 'time'

  belongs_to :visit
  belongs_to :user, optional: true
end

# rubocop:disable Lint/RedundantCopDisableDirective, Layout/LineLength, Style/AsciiComments
# ## Schema Information
#
# Table name: `ahoy_events`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `uuid`             | `not null, primary key`
# **`name`**        | `string`           | `indexed => [time]`
# **`properties`**  | `jsonb`            | `indexed`
# **`time`**        | `datetime`         | `indexed => [name]`
# **`user_id`**     | `uuid`             | `indexed`
# **`visit_id`**    | `uuid`             | `indexed`
#
# ### Indexes
#
# * `index_ahoy_events_on_name_and_time`:
#     * **`name`**
#     * **`time`**
# * `index_ahoy_events_on_properties` (_using_ gin):
#     * **`properties`**
# * `index_ahoy_events_on_user_id`:
#     * **`user_id`**
# * `index_ahoy_events_on_visit_id`:
#     * **`visit_id`**
#
# rubocop:enable Lint/RedundantCopDisableDirective, Layout/LineLength, Style/AsciiComments
