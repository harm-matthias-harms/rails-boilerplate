# frozen_string_literal: true

class CreateIdentities < ActiveRecord::Migration[7.0]
  def change
    create_table :identities, id: :uuid do |t|
      t.references :user, null: false, type: :uuid
      t.string :provider, null: false
      t.string :uid, null: false
      t.timestamps
      t.index %i[provider user_id], unique: true
      t.index %i[provider uid], unique: true
    end

    add_foreign_key :identities, :users, column: :user_id, on_delete: :cascade
  end
end
