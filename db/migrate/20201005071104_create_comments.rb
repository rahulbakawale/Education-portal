class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :comment
      t.references :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
