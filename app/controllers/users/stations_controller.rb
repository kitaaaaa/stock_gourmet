class Users::StationsController < ApplicationController
	def show
		@user = current_user
		@station = Station.find(params[:id])
		@restaurant = @station.restaurants
		@q = Restaurant.ransack(params[:q])
  	@restaurants = @q.result(distinct: true)
	end

	private
	def station_params
		params.require(:station).permit(:name, :address, :station_train)		
	end
end
