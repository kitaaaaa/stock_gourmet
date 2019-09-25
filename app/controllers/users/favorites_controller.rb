class Users::FavoritesController < ApplicationController
	before_action :authenticate_user!

	def create
		restaurant = Restaurant.find(params[:restaurant_id])
		favorite = current_user.favorites.new(restaurant_id: restaurant.id)
		if favorite.save
			redirect_back(fallback_location: root_url)
		end
	end

	def destroy
		favorite = current_user.favorites.find(params[:id])
		if favorite.destroy
			redirect_back(fallback_location: root_url)
		end
	end
end
