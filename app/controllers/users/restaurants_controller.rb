class Users::RestaurantsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@restaurants = Restaurant.all
		@q = Restaurant.ransack(params[:q])
  	@restaurants = @q.result(distinct: true)
		@users = User.all
		@user = current_user
		@stations = Station.all
		@q = Station.ransack(params[:q])
  	@stations = @q.result(distinct: true)
  	@favorites = Favorite.all
		@all_ranks = Restaurant.find(Favorite.group(:restaurant_id).order('count(restaurant_id) desc').limit(10).pluck(:restaurant_id))
		#A.group(x)でAが持つ同じｘでグループ分け
		#restaurant内で数(count)が多い順に(desc)に並べる
		#limit(r)で、表示数をr個までに
		#pluck(t)で、tを数字のみ獲得
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@q = Restaurant.ransack(params[:q])
  	@restaurants = @q.result(distinct: true)
		@favorite = Favorite.find_by(user: current_user, restaurant: @restaurant)
		@stock = Stock.find_by(user: current_user, restaurant: @restaurant)
		@user = current_user
	end

	def new
		@user = current_user
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
		@user = current_user
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		@restaurant.update(restaurant_params)
			redirect_to users_restaurant_path(@restaurant.id)
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to users_user_path(@user)
	end

	private
	def restaurant_params
		params.require(:restaurant).permit(:name, :menu, :genre_id, :station_id, :postal_code, :address, :latitude, :longitude, :budget)		
	end
end


