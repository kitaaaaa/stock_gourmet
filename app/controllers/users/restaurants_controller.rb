class Users::RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all
		@users = User.all
		@user = current_user
		@stations = Station.all
	end

	def show
		@restaurant = Restaurant.find(params[:id])

	end

	def new
		@restaurant = Restaurant.new
		@menu = Menu.new
		@station = Station.new
		@genre = Genre.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		if @restaurant.save
			redirect_to users_restaurant_path(@restaurant.id)
		else
			redirect_to new_users_restaurant_path
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		@restaurant.update(restaurant_params)
			redirect_to users_restaurant_path(@restaurant.id)
	end

	def destroy
		
	end

	private
	def restaurant_params
		params.require(:restaurant).permit(:name, :menu, :genre_id, :station_id, :postal_code, :address, :latitude, :longitude, :budget)		
	end
end
