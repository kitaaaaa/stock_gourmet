class Tag < ApplicationRecord
	has_many :user_tags
	has_many :restaurant_tags
end
