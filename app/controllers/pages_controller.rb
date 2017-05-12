class PagesController < ApplicationController
	def home
		@new = UserListing.order('created_at DESC').limit(5).group_by(&:card_name)
	end
end
