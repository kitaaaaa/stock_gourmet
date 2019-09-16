class Favorite < ApplicationRecord
	belongs_to :restaurant
	belongs_to :user

	varidates_uniqueness_of :user_id, scope: :restaurant_id
end
