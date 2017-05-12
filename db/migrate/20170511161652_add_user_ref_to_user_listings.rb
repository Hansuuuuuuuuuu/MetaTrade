class AddUserRefToUserListings < ActiveRecord::Migration[5.0]
  def change
    add_reference :user_listings, :user, foreign_key: true
  end
end
