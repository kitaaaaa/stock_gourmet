class Users::RelationshipsController < ApplicationController
	before_action :authenticate_user!

	def create
    	user = User.find(params[:follow_id])
		following = current_user.follow(user)
		following.save
		redirect_to users_user_path(user.id)
	end

	def destroy
		user = User.find(params[:follow_id])
		following = current_user.unfollow(user)
		following.destroy
		redirect_to users_user_path(user.id)
  end
end
