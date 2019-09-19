class Users::StationsController < ApplicationController
	def index
			
	end

	def show
		@user = current_user
		@station = Station.find(params[:id])
		@station_trains = @station.station_trains
		@restaurant = @station.restaurants
	end

	private
	def station_params
		params.require(:station).permit(:name, :address, :station_train)		
	end
end
