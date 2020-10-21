class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :rooms_count
      t.integer :memberships_count

      t.timestamps
    end
  end
end
