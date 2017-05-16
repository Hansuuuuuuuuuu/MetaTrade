class UserListing < ApplicationRecord
	belongs_to :user
	validates :card_name, :quantity, :condition, :shift, :price,presence: true

	
end
