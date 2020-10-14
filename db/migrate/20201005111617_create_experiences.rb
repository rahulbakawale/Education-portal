class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.string :companey_name
      t.string :skil
      t.integer :experience_year
      t.references :portfolio, :null => false, :foreign_key => true

      t.timestamps
    end
  end
end
