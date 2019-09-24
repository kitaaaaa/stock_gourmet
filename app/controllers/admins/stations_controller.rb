class Admins::StationsController < ApplicationController
	def index 
		@stations = Station.all
		@q = Station.ransack(params[:q])
  	@stations = @q.result(distinct: true)
	end

	def new
		
	end

	def create
		
	end

	def show
		
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
