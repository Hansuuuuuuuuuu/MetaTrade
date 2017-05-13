class PagesController < ApplicationController
	def home
		@new = UserListing.order('created_at DESC').limit(5).group_by(&:card_name)
	end

	def search_results
		require 'will_paginate/array'

		@results =  MTG::Card.where(name: params[:search]).all
		@results = @results.map{|f| [f.name, f.image_url, f.text]}
		@results = @results.paginate(:page => params[:page], :per_page => 5)
	end

	def card
		@carddd =  MTG::Card.where(name: params[:cn]).all
		@carddd = @carddd.map{|f| [f.name, f.image_url, f.text]}
		@carddd = @carddd.first

		@listings = UserListing.where(:card_name => @carddd[0])
	end

	def traders
		@traders = User.paginate(:page => params[:page], :per_page => 5)
	end
end
