# frozen_string_literal: true

class Ahoy::Visit < ApplicationRecord
  self.table_name = 'ahoy_visits'
  self.implicit_order_column = 'started_at'

  has_many :events, class_name: 'Ahoy::Event', dependent: :delete_all
  belongs_to :user, optional: true
end

# rubocop:disable Lint/RedundantCopDisableDirective, Layout/LineLength, Style/AsciiComments
# ## Schema Information
#
# Table name: `ahoy_visits`
#
# ### Columns
#
# Name                    | Type               | Attributes
# ----------------------- | ------------------ | ---------------------------
# **`id`**                | `uuid`             | `not null, primary key`
# **`app_version`**       | `string`           |
# **`browser`**           | `string`           |
# **`city`**              | `string`           |
# **`country`**           | `string`           |
# **`device_type`**       | `string`           |
# **`ip`**                | `string`           |
# **`landing_page`**      | `text`             |
# **`latitude`**          | `float`            |
# **`longitude`**         | `float`            |
# **`os`**                | `string`           |
# **`os_version`**        | `string`           |
# **`platform`**          | `string`           |
# **`referrer`**          | `text`             |
# **`referring_domain`**  | `string`           |
# **`region`**            | `string`           |
# **`started_at`**        | `datetime`         | `indexed => [visitor_token]`
# **`user_agent`**        | `text`             |
# **`utm_campaign`**      | `string`           |
# **`utm_content`**       | `string`           |
# **`utm_medium`**        | `string`           |
# **`utm_source`**        | `string`           |
# **`utm_term`**          | `string`           |
# **`visit_token`**       | `string`           | `indexed`
# **`visitor_token`**     | `string`           | `indexed => [started_at]`
# **`user_id`**           | `uuid`             | `indexed`
#
# ### Indexes
#
# * `index_ahoy_visits_on_user_id`:
#     * **`user_id`**
# * `index_ahoy_visits_on_visit_token` (_unique_):
#     * **`visit_token`**
# * `index_ahoy_visits_on_visitor_token_and_started_at`:
#     * **`visitor_token`**
#     * **`started_at`**
#
# rubocop:enable Lint/RedundantCopDisableDirective, Layout/LineLength, Style/AsciiComments
