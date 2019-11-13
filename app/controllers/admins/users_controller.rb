class Admins::UsersController < ApplicationController
	before_action :authenticate_admins_admin!
	def index 
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :telephone_number, :introduction)
	end
end
