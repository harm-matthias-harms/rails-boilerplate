# frozen_string_literal: true

class BumpAhoyTo5 < ActiveRecord::Migration[7.0]
  def change
    add_index :ahoy_visits, %i[visitor_token started_at]
  end
end
