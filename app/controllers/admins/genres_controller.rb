class Admins::GenresController < ApplicationController
	before_action :authenticate_admins_admin!
	def index
		@genres = Genre.all
	end

	def show
		@genre = Genre.find(params[:id])
	end

	def new
		@genre = Genre.new
	end

	def create
		@genre = Genre.new(genre_params)
		if @genre.save
			redirect_to admins_genre_path(@genre.id)
		else
			redirect_to new_admins_genre_path
		end
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		@genre = Genre.find(params[:id])
		if @genre.update(genre_params)
			redirect_to admins_genre_path(@genre.id)
		else
			redirect_to edit_admins_genre_path(@genre.id)
		end
	end

	private
	def genre_params
		params.require(:genre).permit(:name)
	end
end
