class Users::RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all
		@users = User.all
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
		p "@@@@@@@@@@@@@@@@@"
		p restaurant_params
		@restaurant = Restaurant.new(restaurant_params)
		if @restaurant.save
			redirect_to root_path
		else
			redirect_to new_users_restaurant_path
		end
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private
	def restaurant_params
		params.require(:restaurant).permit(:name, :menu, :genre_id, :station_id, :postal_code, :address, :latitude, :longitude, :budget)		
	end
end
