class CreateFriendlists < ActiveRecord::Migration[6.0]
  def change
    create_table :friendlists do |t|
      t.string :status
      t.integer :friend_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
