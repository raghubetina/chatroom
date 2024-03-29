# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.boolean :anyone_can_join, default: true
      t.references :creator, null: true, foreign_key: { to_table: :users }
      t.references :team, null: false, foreign_key: true
      t.boolean :hidden, default: false

      t.timestamps
    end
  end
end
