class Users::StocksController < ApplicationController
	before_action :authenticate_user!
	
	def create
		restaurant = Restaurant.find(params[:restaurant_id])
		stock = current_user.stocks.new(restaurant_id: restaurant.id)
		stock.save
		redirect_back(fallback_location: root_url)
	end

	def destroy
		stock = current_user.stocks.find(params[:id])
		if stock.destroy
			redirect_back(fallback_location: root_url)
		end
	end
end
