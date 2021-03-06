class Restaurant < ApplicationRecord
	attachment :image
	
	belongs_to :genre
	belongs_to :station

	has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user
	has_many :stocks, dependent: :destroy
	has_many :stocked_users, through: :stocks, source: :user

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	def stocked_by?(user)
		stocks.where(user_id: user.id).exists?
	end
end