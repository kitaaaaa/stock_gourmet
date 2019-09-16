class Restaurant < ApplicationRecord
	belongs_to :genre
	belongs_to :station

	has_many :favorites
	has_many :menus
	has_many :restaurant_tags
end
