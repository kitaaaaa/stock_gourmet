class Tag < ApplicationRecord
	has_many :user_tags
	has_many :restaurants, through: :restaurant_tags
end
