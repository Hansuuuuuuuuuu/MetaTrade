class AddAvgRatingToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :average_rating, :decimal
  end
end
