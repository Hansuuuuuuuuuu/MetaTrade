class CreateUserListings < ActiveRecord::Migration[5.0]
  def change
    create_table :user_listings do |t|
      t.string :card_name
      t.integer :quantity
      t.string :condition
      t.decimal :price

      t.timestamps
    end
  end
end
