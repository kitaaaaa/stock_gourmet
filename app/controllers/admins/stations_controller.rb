class Admins::StationsController < ApplicationController
	def index 
		@stations = Station.all
		@q = Station.ransack(params[:q])
  	@stations = @q.result(distinct: true)
	end

	def new
		@station = Station.new
	end

	def create
		
	end

	def show
		@station = Station.find(params[:id])
		@station_trains = @station.station_trains
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private
	def station_params
		params.require(:station).permit(:name, :id, :address, :station_train)		
	end
end
