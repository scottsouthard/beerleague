class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :league_type
      t.integer :admin_id

      t.timestamps null: false
    end
  end
end
