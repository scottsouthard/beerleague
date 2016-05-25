class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :season_id
      t.date :start_date
      t.string :location

      t.timestamps null: false
    end
  end
end
