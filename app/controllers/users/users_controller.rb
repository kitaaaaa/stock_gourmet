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
		
	end

	def quit
		
	end

	private
	def user_params
		params.require(:user).permit(:id, :email, :family_name, :first_name, :family_name_kana, :first_name_kana, :telephone_number, :postal_code, :address, :is_quit)
	end
end
