class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.boolean :anyone_can_join
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.references :team, null: false, foreign_key: true
      t.boolean :hidden

      t.timestamps
    end
  end
end
