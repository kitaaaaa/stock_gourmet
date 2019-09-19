class Restaurant < ApplicationRecord
	attachment :image
	
	belongs_to :genre
	belongs_to :station

	has_many :favorites
	has_many :menus
	has_many :restaurant_tags
end
