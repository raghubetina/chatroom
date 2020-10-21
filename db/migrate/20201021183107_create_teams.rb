# frozen_string_literal: true

class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :rooms_count, default: 0
      t.integer :memberships_count, default: 0

      t.timestamps
    end
  end
end
