# frozen_string_literal: true

class CreateConsents < ActiveRecord::Migration[7.0]
  def change
    create_table :consents, id: :uuid do |t|
      t.references :user, null: false, type: :uuid
      t.inet :ip, null: false
      t.text :user_agent, null: false
      t.text :type, null: false
      t.text :consent, null: false
      t.boolean :accepted, null: false, default: false

      t.timestamps
    end

    add_foreign_key :consents, :users, column: :user_id, on_delete: :cascade
  end
end
