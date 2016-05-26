class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name, { null: false }
      t.string :email, { null: false }
      t.string :password_digest, { null: false }
      t.boolean :league_admin, { null: false }

      t.timestamps null: false
    end
  end
end
