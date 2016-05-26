class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :team_id
      t.integer :user_id
      t.string :membership_type

      t.timestamps null: false
    end
  end
end
