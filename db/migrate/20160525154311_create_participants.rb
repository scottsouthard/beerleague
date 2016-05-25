class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :game_id
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
