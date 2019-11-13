class Admins::StationsController < ApplicationController
	before_action :authenticate_admins_admin!

	def index 
		@stations = Station.all
		@q = Station.ransack(params[:q])
  	@stations = @q.result(distinct: true)
	end

	def new
		@station = Station.new
	end

	def create
		@station = Station.new(station_params)
		if @station.save
			redirect_to admins_station_path(@station.id)
		else
			redirect_to admins_stations_path
		end
	end

	def show
		@station = Station.find(params[:id])
	end

	def edit
		@station = Station.find(params[:id])
	end

	def update
		@station = Station.find(params[:id])
		if @station.update(station_params)
			redirect_to admins_station_path(@station.id)
		else
			redirect_to edit_admins_station_path(@station.id)
		end
	end

	private
	def station_params
		params.require(:station).permit(:name, :id, :address, 

			)		
	end
end
