class CreateEducas < ActiveRecord::Migration[6.0]
  def change
    create_table :educas do |t|
      t.string :university
      t.integer :passing_year
      t.references :portfolio, :null => false, :foreign_key => true

      t.timestamps
    end
  end
end
