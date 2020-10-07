class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact_num
      t.string :city
      t.text :address
      t.integer :pin_code
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
