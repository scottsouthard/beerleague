class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :game_id
      t.integer :winner_id
      t.integer :loser_id
      t.integer :winner_score
      t.integer :loser_score
      t.string :description

      t.timestamps null: false
    end
  end
end
