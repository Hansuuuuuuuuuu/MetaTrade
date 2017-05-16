class UserListing < ApplicationRecord
	belongs_to :user
	validates :card_name, :quantity, :condition,  :price,presence: true

	
end
