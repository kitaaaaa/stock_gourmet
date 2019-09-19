class Users::UsersController < ApplicationController
	def show
		@user = current_user
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to users_user_path(@user.id)
		else
			redirect_to edit_users_user_path(@user.id)
		end
	end

	def withdrawal
		@user = User.find(params[:id])
	end

	def destroy #論理削除
		@user = User.find(params[:id])
		@user.is_quit
		redirect_to destroy_user_session_path
	end

	private
	def user_params
		params.require(:user).permit(:id, :email, :name, 
			:telephone_number, :is_quit, :image)
	end
end
